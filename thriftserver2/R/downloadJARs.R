getJARs<-function(){
  status = lapply(
    c(
      "http://central.maven.org/maven2/org/apache/hive/hive-jdbc/0.14.0/hive-jdbc-0.14.0.jar",
      "http://central.maven.org/maven2/org/apache/hive/hive-service/0.14.0/hive-service-0.14.0.jar",
      "http://central.maven.org/maven2/org/apache/hive/hive-common/0.14.0/hive-common-0.14.0.jar",
      "http://central.maven.org/maven2/org/apache/httpcomponents/httpcore/4.2.5/httpcore-4.2.5.jar",
      "http://central.maven.org/maven2/org/apache/httpcomponents/httpclient/4.2.5/httpclient-4.2.5.jar",
      "http://repo1.maven.org/maven2/org/apache/thrift/libthrift/0.9.1/libthrift-0.9.1.jar",
      "http://central.maven.org/maven2/com/google/guava/guava/18.0/guava-18.0.jar", # required for data types in the result set
      "http://central.maven.org/maven2/org/apache/hadoop/hadoop-common/2.6.0/hadoop-common-2.6.0.jar",
      "http://central.maven.org/maven2/commons-logging/commons-logging/1.1.3/commons-logging-1.1.3.jar",
      "http://central.maven.org/maven2/org/slf4j/slf4j-api/1.7.12/slf4j-api-1.7.12.jar",
      "http://central.maven.org/maven2/log4j/log4j/1.2.17/log4j-1.2.17.jar"
    ),
    download.ifNotExists
  )
  unlist(status)
}

download.ifNotExists<-function(fileUrl){
  destination = sprintf("%s/%s",system.file(package = "thriftserver2"), "jars")
  if(!dir.exists(destination)){
    dir.create(destination)
  }
  file.name=tail(unlist(strsplit(fileUrl, "\\/")),1)
  file.full.path = sprintf("%s/%s", destination, file.name)
  if(! file.exists(file.full.path)){
    download.file(fileUrl, file.full.path)
  }
}
