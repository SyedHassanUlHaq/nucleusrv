package nucleusrv.components

import chisel3._
import chisel3.simulator.EphemeralSimulator._
import chisel3.experimental.BundleLiterals._
import org.scalatest.freespec.AnyFreeSpec
import org.scalatest.matchers.must.Matchers
import org.scalatest.TestData

class TopTest extends AnyFreeSpec with Matchers {

  def getProgramFile(implicit testData: TestData): Option[String] = {
    if (testData.configMap.contains("programFile")) {
      Some(testData.configMap("programFile").toString)
    } else {
      None
    }
  }

  def getDataFile(implicit testData: TestData): Option[String] = {
    if (testData.configMap.contains("dataFile")) {
      Some(testData.configMap("dataFile").toString)
    } else {
      None
    }
  }

  "Top Test" in { implicit testData: TestData =>  // Explicitly specify the type of testData
    val programFile = getProgramFile
    val dataFile = getDataFile

    simulate(new Top(programFile, dataFile)) { dut =>
      dut.clock.step(1000)
    }
  }
}
