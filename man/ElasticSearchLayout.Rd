% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ElasticSearchLayout.R
\docType{data}
\name{transform_event_elasticsearch}
\alias{transform_event_elasticsearch}
\alias{ElasticSearchLayout}
\title{A json layout for Elasticsearch ingestion}
\format{
An object of class \code{LayoutJson} (inherits from \code{Layout}, \code{R6}) of length 17.
}
\usage{
transform_event_elasticsearch(event)

ElasticSearchLayout
}
\arguments{
\item{event}{A \link[lgr:LogEvent]{lgr::LogEvent} object.}
}
\value{
A \code{list} of key-value pairs ready to be serialized to JSON for ElasticSearch
}
\description{
Transforms a \link[lgr:LogEvent]{lgr::LogEvent} object into a list suitable for ElasticSearch ingestion.
}
\seealso{
\url{https://www.elastic.co/docs/reference/ecs}
}
\keyword{datasets}
