package nucleusrv.csr

import chisel3._
import chisel3.util._

case class CSROperations(
    val READ    :UInt   =   0.U(2.W),
    val WRITE   :UInt   =   1.U(2.W),
    val SET     :UInt   =   2.U(2.W),
    val CLEAR   :UInt   =   3.U(2.W)
)

class CSRRegFile extends Module{
    val io = IO(new CSRRegFileIO)

    /****************** Initializations ******************/
    // Registers
    val MISA_REG            = RegInit(0.U(32.W))
    val MHARTID_REG         = RegInit(0.U(32.W))

    // Hardwired
    MISA_REG                := io.MISA.i_value
    MHARTID_REG             := io.MHARTID.i_value

    // Wires
    val w_data              = Wire(UInt(32.W))
    val r_data              = Wire(UInt(32.W))

    val csr_opr = CSROperations()
    /*************************************************/

    /****************** Read Logic ******************/
    var READ,WRITE,SET,CLEAR = Wire(UInt(2.W))
    Seq(READ,WRITE,SET,CLEAR) zip Seq(csr_opr.READ, csr_opr.WRITE, csr_opr.SET, csr_opr.CLEAR) map (x => x._1 := x._2)

    val READ_CASES = Array(
        AddressMap.MISA    -> MISA_REG,
        AddressMap.MHARTID -> MHARTID_REG
    )

    r_data := MuxLookup(io.CSR.i_addr, DontCare, READ_CASES)

    io.CSR.o_data := r_data
    /*************************************************/

    /****************** Write Logic ******************/
    val set_data   = r_data |  io.CSR.i_data
    val clear_data = r_data & ~io.CSR.i_data

    // Identify the operation
    w_data := MuxLookup(io.CSR.i_opr, DontCare, Array(
        WRITE -> io.CSR.i_data,
        SET   -> set_data,
        CLEAR -> clear_data
    ))

    // Write to the register
    when(io.CSR.i_w_en){
        switch(io.CSR.i_addr){
            is(AddressMap.MISA){
                MISA_REG := w_data
            }
        }
    }
    /*************************************************/
}