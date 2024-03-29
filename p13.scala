import org.apache.spark.sql.SparkSession

object ipl {

  def main(args: Array[String]) {

    val pathToDB = "/home/student/res/indian-premier-league-csv-dataset"
    val sparkSession = SparkSession.builder().appName("My SQL Session").getOrCreate()
    import sparkSession.implicits._
  
    // The Match.csv file has the toss won/match won data for every game.
    // Read the file into a dataframe.

    val matchDF = sparkSession.read.format("csv").
      option("sep", ",").
      option("inferSchema", "true").
      option("header", "true").
      load(pathToDB + "/Match.csv")

    // Since we have to use SQL queries, the dataframe has to be registered as a table.
    // We can create a temporary table view.
    matchDF.createOrReplaceTempView("matchStats")

    // find the total number of entries in the table. this is equal to number of matches played or N.
    val N = sparkSession.sql("SELECT COUNT(*) FROM matchstats")
      .first()(0)
      .asInstanceOf[Long]
    // N.show()

    // Find the subset of entries where the toss winner is also the match winner. This will be a dataframe.
    val tossNMatchwinnersDF = sparkSession.sql("SELECT * FROM matchstats WHERE Toss_Winner_Id = Match_Winner_Id")

    // register the dataframe as a temporary table so that you can use SQL queries on it.
    tossNMatchwinnersDF.createOrReplaceTempView("tossNMatchwinners")

    // find the count of entries in this Table. This gives us M.
    val M = sparkSession.sql("SELECT COUNT(*) FROM tossNMatchwinners")
      .first()(0)
      .asInstanceOf[Long]
    // M.show()

    // print M * 100 / N.
    println("Percentage of times Toss Winners have won the match = " + (M*100.0)/N + "%")
  }
}

#############################  ipl.sbt  ##############################################

name := "ipl"
version := "1.0"
scalaVersion := "2.11.12"
libraryDependencies ++= Seq(
    "org.apache.spark" %% "spark-core" % "2.3.0",
    "org.apache.spark" % "spark-sql_2.11" % "2.1.0"
)
