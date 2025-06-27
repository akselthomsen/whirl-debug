cat("\n------ Session info --------\n")

sessioninfo::session_info(info = c("platform", "packages", "python"))

sessioninfo::external_info()

cat("\n------ Debug --------\n")

cat(getwd(), "\n")

library(whirl)

y <- whirl:::whirl_r_session$new(verbosity_level = "minimal")
cat(y$get_wd(), "\n")

y$log_script("mtcars.R")
y$wait()
y$read()

y$create_log()
y$wait()$read()

y$log_finish()
y$create_outputs(out_dir = ".", format = "html")

stopifnot(file.exists("mtcars_log.html"))

cat("\n------ Run() --------\n")

x <- whirl::run("mtcars.R")

cat("\n------ Checks --------\n")

stopifnot(x$status == "success")

x$result[[1]]$logs |> 
    file.exists() |> 
    stopifnot()

cat("\n------ Queue --------\n")

print(x)

cat("\n------ Result --------\n")

str(x$result)
