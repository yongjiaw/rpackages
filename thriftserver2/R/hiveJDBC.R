HiveJDBC <- function(){
  library(rJava)
  library(RJDBC)
  getJARs()
  jarDir = system.file("jars", package = "thriftserver2")
  .jinit(classpath=dir(jarDir, full.names = TRUE), force.init = TRUE)
  JDBC("org.apache.hive.jdbc.HiveDriver",
       system.file("jars/hive-jdbc-0.14.0.jar", package = "thriftserver2"),
       identifier.quote="`")
}
