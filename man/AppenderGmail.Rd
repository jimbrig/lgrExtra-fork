% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AppenderDigest.R
\name{AppenderGmail}
\alias{AppenderGmail}
\title{Send emails via the Gmail REST API}
\value{
The \verb{$new()} method returns an \link[R6:R6Class]{R6::R6} that inherits from
\link[lgr:Appender]{lgr::Appender} and can be uses as an appender by a \link[lgr:Logger]{lgr::Logger}.
}
\description{
Send mails via \code{\link[gmailr:gm_send_message]{gmailr::gm_send_message()}}. This
Appender keeps an in-memory buffer like \link[lgr:AppenderBuffer]{lgr::AppenderBuffer}. If the buffer is
flushed, usually because an event of specified magnitude is encountered, all
buffered events are concatenated to a single message. The default behavior
is to push the last 30 log events in case a \code{fatal} event is encountered.

\strong{NOTE:} This Appender requires that you set up google API authorization,
please refer to the \href{https://github.com/r-lib/gmailr}{documentation of gmailr}
for details.
}
\seealso{
\link[lgr:LayoutFormat]{lgr::LayoutFormat}, \link[lgr:LayoutGlue]{lgr::LayoutGlue}

Other Appenders: 
\code{\link{AppenderAWSCloudWatchLog}},
\code{\link{AppenderDbi}},
\code{\link{AppenderDynatrace}},
\code{\link{AppenderElasticSearch}},
\code{\link{AppenderPool}},
\code{\link{AppenderPushbullet}},
\code{\link{AppenderSendmail}},
\code{\link{AppenderSyslog}}
}
\concept{Appenders}
\section{Super classes}{
\code{\link[lgr:Filterable]{lgr::Filterable}} -> \code{\link[lgr:Appender]{lgr::Appender}} -> \code{\link[lgr:AppenderMemory]{lgr::AppenderMemory}} -> \code{\link[lgrExtra:AppenderDigest]{lgrExtra::AppenderDigest}} -> \code{\link[lgrExtra:AppenderMail]{lgrExtra::AppenderMail}} -> \code{AppenderGmail}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-AppenderGmail-new}{\code{AppenderGmail$new()}}
\item \href{#method-AppenderGmail-flush}{\code{AppenderGmail$flush()}}
}
}
\if{html}{\out{
<details><summary>Inherited methods</summary>
<ul>
<li><span class="pkg-link" data-pkg="lgr" data-topic="Filterable" data-id="add_filter"><a href='../../lgr/html/Filterable.html#method-Filterable-add_filter'><code>lgr::Filterable$add_filter()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgr" data-topic="Filterable" data-id="filter"><a href='../../lgr/html/Filterable.html#method-Filterable-filter'><code>lgr::Filterable$filter()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgr" data-topic="Filterable" data-id="remove_filter"><a href='../../lgr/html/Filterable.html#method-Filterable-remove_filter'><code>lgr::Filterable$remove_filter()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgr" data-topic="Filterable" data-id="set_filters"><a href='../../lgr/html/Filterable.html#method-Filterable-set_filters'><code>lgr::Filterable$set_filters()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgr" data-topic="Appender" data-id="set_layout"><a href='../../lgr/html/Appender.html#method-Appender-set_layout'><code>lgr::Appender$set_layout()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgr" data-topic="Appender" data-id="set_threshold"><a href='../../lgr/html/Appender.html#method-Appender-set_threshold'><code>lgr::Appender$set_threshold()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgr" data-topic="AppenderMemory" data-id="append"><a href='../../lgr/html/AppenderMemory.html#method-AppenderMemory-append'><code>lgr::AppenderMemory$append()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgr" data-topic="AppenderMemory" data-id="clear"><a href='../../lgr/html/AppenderMemory.html#method-AppenderMemory-clear'><code>lgr::AppenderMemory$clear()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgr" data-topic="AppenderMemory" data-id="set_buffer_size"><a href='../../lgr/html/AppenderMemory.html#method-AppenderMemory-set_buffer_size'><code>lgr::AppenderMemory$set_buffer_size()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgr" data-topic="AppenderMemory" data-id="set_flush_on_exit"><a href='../../lgr/html/AppenderMemory.html#method-AppenderMemory-set_flush_on_exit'><code>lgr::AppenderMemory$set_flush_on_exit()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgr" data-topic="AppenderMemory" data-id="set_flush_on_rotate"><a href='../../lgr/html/AppenderMemory.html#method-AppenderMemory-set_flush_on_rotate'><code>lgr::AppenderMemory$set_flush_on_rotate()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgr" data-topic="AppenderMemory" data-id="set_flush_threshold"><a href='../../lgr/html/AppenderMemory.html#method-AppenderMemory-set_flush_threshold'><code>lgr::AppenderMemory$set_flush_threshold()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgr" data-topic="AppenderMemory" data-id="set_should_flush"><a href='../../lgr/html/AppenderMemory.html#method-AppenderMemory-set_should_flush'><code>lgr::AppenderMemory$set_should_flush()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgr" data-topic="AppenderMemory" data-id="show"><a href='../../lgr/html/AppenderMemory.html#method-AppenderMemory-show'><code>lgr::AppenderMemory$show()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgrExtra" data-topic="AppenderDigest" data-id="set_subject_layout"><a href='../../lgrExtra/html/AppenderDigest.html#method-AppenderDigest-set_subject_layout'><code>lgrExtra::AppenderDigest$set_subject_layout()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgrExtra" data-topic="AppenderMail" data-id="format"><a href='../../lgrExtra/html/AppenderMail.html#method-AppenderMail-format'><code>lgrExtra::AppenderMail$format()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgrExtra" data-topic="AppenderMail" data-id="set_bcc"><a href='../../lgrExtra/html/AppenderMail.html#method-AppenderMail-set_bcc'><code>lgrExtra::AppenderMail$set_bcc()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgrExtra" data-topic="AppenderMail" data-id="set_cc"><a href='../../lgrExtra/html/AppenderMail.html#method-AppenderMail-set_cc'><code>lgrExtra::AppenderMail$set_cc()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgrExtra" data-topic="AppenderMail" data-id="set_from"><a href='../../lgrExtra/html/AppenderMail.html#method-AppenderMail-set_from'><code>lgrExtra::AppenderMail$set_from()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgrExtra" data-topic="AppenderMail" data-id="set_html"><a href='../../lgrExtra/html/AppenderMail.html#method-AppenderMail-set_html'><code>lgrExtra::AppenderMail$set_html()</code></a></span></li>
<li><span class="pkg-link" data-pkg="lgrExtra" data-topic="AppenderMail" data-id="set_to"><a href='../../lgrExtra/html/AppenderMail.html#method-AppenderMail-set_to'><code>lgrExtra::AppenderMail$set_to()</code></a></span></li>
</ul>
</details>
}}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-AppenderGmail-new"></a>}}
\if{latex}{\out{\hypertarget{method-AppenderGmail-new}{}}}
\subsection{Method \code{new()}}{
see \link{AppenderMail} for details
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{AppenderGmail$new(
  to,
  threshold = NA_integer_,
  flush_threshold = "fatal",
  layout = LayoutFormat$new(fmt = "\%L [\%t] \%m \%f", timestamp_fmt = "\%H:\%M:\%S"),
  subject_layout = LayoutFormat$new(fmt = "[LGR] \%L: \%m"),
  buffer_size = 30,
  from = get_user(),
  cc = NULL,
  bcc = NULL,
  html = FALSE,
  filters = NULL
)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-AppenderGmail-flush"></a>}}
\if{latex}{\out{\hypertarget{method-AppenderGmail-flush}{}}}
\subsection{Method \code{flush()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{AppenderGmail$flush()}\if{html}{\out{</div>}}
}

}
}
