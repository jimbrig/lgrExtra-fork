# AppenderDbi -------------------------------------------------------------


#' Log to Dynatrace via HTTP
#'
#' @description
#' Log to Dynatrace via the Dynatrace log ingestion API.
#'
#' @template appender
#'
#' @seealso \url{https://docs.dynatrace.com/docs/analyze-explore-automate/logs/lma-log-ingestion/lma-log-ingestion-via-api}
#'
#' @export
AppenderDynatrace <- R6::R6Class(
  "AppenderDynatrace",
  inherit = lgr::AppenderMemory,
  cloneable = FALSE,
  public = list(
    #' @param url see section *Fields*
    #' @param threshold,flush_threshold,layout,buffer_size see [lgr::AppenderBuffer]
    initialize = function(
    url,
    api_key,
    threshold = NA_integer_,
    layout = DynatraceLayout,
    buffer_size = 0,
    flush_threshold = "error",
    flush_on_exit = TRUE,
    flush_on_rotate = TRUE,
    should_flush = NULL,
    filters = NULL
  ){
      assert_namespace("httr2")

      # appender
      self$set_threshold(threshold)
      self$set_layout(layout)
      self$set_filters(filters)

      # buffer
      private$initialize_buffer(buffer_size)

      # flush conditions
      self$set_should_flush(should_flush)
      self$set_flush_threshold(flush_threshold)
      self$set_flush_on_exit(flush_on_exit)
      self$set_flush_on_rotate(flush_on_rotate)

      # connection
      self$set_url(url)
      self$set_api_key(api_key)

      self
    },


    set_url = function(url){
      assert(is_scalar_character(url))
      private$.url <- url
      invisible(self)
    },


    set_api_key = function(api_key){
      assert(is_scalar_character(api_key))
      private[[".api_key"]] <- api_key
      invisible(self)
    },


    #' @description Get log as data.frame: Not supported for Dynatrace
    get_data = function(
      n = 20L,
      threshold = NA,
      result_type = "data.frame"
    ){
      stop("Not supported for Dynatrace")
    },


    #' @description Show log in console: Not supported for Dynatrace
    show = function(
      threshold = NA_integer_,
      n = 20
    ){
      stop("Not supported for Dynatrace")
    },


    flush = function(){

      buffer <- get("buffer_events", envir = self)

      if (length(buffer)){
        url  <- get("url", envir = self)

        json_body <- lapply(buffer, function(event) {
          json_event  <- self[["layout"]][["format_event"]](event)
        })

        json_body <- paste0("[", paste(json_body, collapse = ","), "]")

        # Send log request
          # we cannot use piping here because we want to support old R version
          # and also avoid magrittr
          request <- httr2::request(url)
          request <- httr2::req_method(request, "POST")
          request <- httr2::req_headers(request, "Content-Type" = "application/json")
          request <- httr2::req_headers(request, Authorization = sprintf("Api-Token %s", self[["api_key"]]))
          request <- httr2::req_body_raw(request, json_body)

          response <- httr2::req_perform(request)

        # reset buffer
          assign("insert_pos", 0L, envir = private)
          private$.buffer_events <- list()

        invisible(self)
      }
    }
  ),


  # +- active ---------------------------------------------------------------
  active = list(
    destination = function(){
      self$url
    },


    #' @field url a `string` url
    url = function(){
      private$.url
    },

    #' @field api_key a `string` api_key. Also referred to as "Api Token"
    api_key = function(){
      private[[".api_key"]]
    }
  ),

  # +- private -------------------------------------------------------------
  private = list(
    finalize = function() {
      if (self$flush_on_exit)
        self$flush()
    },

    .url = NULL,
    .api_key = NULL
  )
)
