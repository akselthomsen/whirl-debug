cat("\n------ Debug --------\n")

cat(getwd(), "\n")

y <- whirl:::whirl_r_session$new(verbosity_level = "minimal")
cat(y$get_wd(), "\n")

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
