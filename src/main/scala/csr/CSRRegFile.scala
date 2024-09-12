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
    val MCAUSE_REG          = RegInit(0.U(32.W))
    val MTVEC_REG           = RegInit(0.U(32.W))
    val MEPC_REG            = RegInit(0.U(32.W))
    val MIE_REG             = RegInit(0.U(32.W))
    val MSCRATCH_REG        = RegInit(0.U(32.W))
    val MIP_REG             = RegInit(0.U(32.W))
    val MTVAL_REG           = RegInit(0.U(32.W))
    
    // MSTATUS
    val MSTATUS_SIE_REG     = RegInit(0.U(1.W))
    val MSTATUS_MIE_REG     = RegInit(0.U(1.W))
    val MSTATUS_SPIE_REG    = RegInit(0.U(1.W))
    val MSTATUS_UBE_REG     = RegInit(0.U(1.W))
    val MSTATUS_MPIE_REG    = RegInit(0.U(1.W))
    val MSTATUS_SPP_REG     = RegInit(0.U(1.W))
    val MSTATUS_VS_REG      = RegInit(0.U(2.W))
    val MSTATUS_MPP_REG     = RegInit(0.U(2.W))
    val MSTATUS_FS_REG      = RegInit(0.U(2.W))
    val MSTATUS_XS_REG      = RegInit(0.U(2.W))
    val MSTATUS_MPRV_REG    = RegInit(0.U(1.W))
    val MSTATUS_SUM_REG     = RegInit(0.U(1.W))
    val MSTATUS_MXR_REG     = RegInit(0.U(1.W))
    val MSTATUS_TVM_REG     = RegInit(0.U(1.W))
    val MSTATUS_TW_REG      = RegInit(0.U(1.W))
    val MSTATUS_TSR_REG     = RegInit(0.U(1.W))
    val MSTATUS_SD_REG      = RegInit(0.U(1.W))
    val MSTATUS_WPRI_REG    = RegInit(0.U(11.W))

    //FCSR 
    val FCSR_NX_REG         = RegInit(0.U(1.W))
    val FCSR_UF_REG         = RegInit(0.U(1.W))
    val FCSR_OF_REG         = RegInit(0.U(1.W))
    val FCSR_DZ_REG         = RegInit(0.U(1.W))
    val FCSR_NV_REG         = RegInit(0.U(1.W))
    val FCSR_FRM_REG        = RegInit(0.U(3.W))

    // Hardwired
    MISA_REG                := io.MISA.i_value
    MHARTID_REG             := io.MHARTID.i_value


    io.FCSR.nx              := FCSR_NX_REG
    io.FCSR.uf              := FCSR_UF_REG
    io.FCSR.of              := FCSR_OF_REG
    io.FCSR.dz              := FCSR_DZ_REG
    io.FCSR.nv              := FCSR_NV_REG
    io.FCSR.frm             := FCSR_FRM_REG

    // Wires
    val w_data                  = Wire(UInt(32.W))
    val r_data                  = Wire(UInt(32.W))
    val MSTATUS_WIRE            = WireInit(Cat(MSTATUS_SD_REG, MSTATUS_WPRI_REG(10, 3), MSTATUS_TSR_REG, MSTATUS_TW_REG, MSTATUS_TVM_REG, MSTATUS_MXR_REG, MSTATUS_SUM_REG, MSTATUS_MPRV_REG, MSTATUS_XS_REG, MSTATUS_FS_REG, MSTATUS_MPP_REG, MSTATUS_VS_REG, MSTATUS_SPP_REG, MSTATUS_MPIE_REG, MSTATUS_UBE_REG, MSTATUS_SPIE_REG, MSTATUS_WPRI_REG(2), MSTATUS_MIE_REG, MSTATUS_WPRI_REG(1), MSTATUS_SIE_REG, MSTATUS_WPRI_REG(0)))
    val MCAUSE_WLRL_WIRE        = WireInit(MCAUSE_REG(30,0))
    val MCAUSE_INTERRUPT_WIRE   = WireInit(MCAUSE_REG(31))
    val MTVEC_MODE_WIRE         = WireInit(MTVEC_REG(1,0))
    val MTVEC_BASE_WIRE         = WireInit(MTVEC_REG(31,2))
    val FFLAGS_WIRE             = WireInit(Cat("b0".U(27.W),FCSR_NV_REG,FCSR_DZ_REG,FCSR_OF_REG,FCSR_UF_REG,FCSR_NX_REG))
    val FRM_WIRE                = WireInit(Cat("b0".U(29.W),FCSR_FRM_REG))
    val FCSR_WIRE               = WireInit(Cat("b0".U(24.W),FCSR_FRM_REG,FCSR_NV_REG,FCSR_DZ_REG,FCSR_OF_REG,FCSR_UF_REG,FCSR_NX_REG))

    val csr_opr = CSROperations()
    /*************************************************/

    /****************** Read Logic ******************/
    var READ,WRITE,SET,CLEAR = Wire(UInt(2.W))
    Seq(READ,WRITE,SET,CLEAR) zip Seq(csr_opr.READ, csr_opr.WRITE, csr_opr.SET, csr_opr.CLEAR) map (x => x._1 := x._2)

    val READ_CASES = Array(
        AddressMap.MISA         -> MISA_REG,
        AddressMap.MHARTID      -> MHARTID_REG,
        AddressMap.MSTATUS      -> MSTATUS_WIRE,
        AddressMap.MCAUSE       -> MCAUSE_REG,
        AddressMap.MTVEC        -> MTVEC_REG,
        AddressMap.MEPC         -> MEPC_REG,
        AddressMap.MIE          -> MIE_REG,
        AddressMap.MSCRATCH     -> MSCRATCH_REG,
        AddressMap.MIP          -> MIP_REG,
        AddressMap.MTVAL        -> MTVAL_REG,
        AddressMap.FFLAGS       -> FFLAGS_WIRE,
        AddressMap.FRM          -> FRM_WIRE,
        AddressMap.FCSR         -> FCSR_WIRE
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
            is(AddressMap.MSTATUS){
                MSTATUS_SD_REG   := w_data(31)
                MSTATUS_WPRI_REG := Cat(w_data(30,23), w_data(4), w_data(2), w_data(0))
                MSTATUS_TSR_REG  := w_data(22)
                MSTATUS_TW_REG   := w_data(21)
                MSTATUS_TVM_REG  := w_data(20) 
                MSTATUS_MXR_REG  := w_data(19)
                MSTATUS_SUM_REG  := w_data(18)
                MSTATUS_MPRV_REG := w_data(17)
                MSTATUS_XS_REG   := w_data(16,15)
                MSTATUS_FS_REG   := w_data(14,13)
                MSTATUS_MPP_REG  := w_data(12,11)
                MSTATUS_VS_REG   := w_data(10,9)
                MSTATUS_SPP_REG  := w_data(8)
                MSTATUS_MPIE_REG := w_data(7)
                MSTATUS_UBE_REG  := w_data(6)
                MSTATUS_SPIE_REG := w_data(5)
                MSTATUS_MIE_REG  := w_data(3)
                MSTATUS_SIE_REG  := w_data(1)
                
            }
            is(AddressMap.MCAUSE){
                MCAUSE_REG       := w_data
            }
            is(AddressMap.MTVEC){
                MTVEC_REG        := w_data
            }
            is(AddressMap.MEPC){
                MEPC_REG         := w_data
            }
            is(AddressMap.MIE){
                MIE_REG          := w_data
            }
            is(AddressMap.MSCRATCH){
                MSCRATCH_REG     := w_data
            }
            is(AddressMap.MIP){
                MIP_REG          := w_data
            }
            is(AddressMap.MTVAL){
                MTVAL_REG        := w_data
            }
            is(AddressMap.FCSR){
               FCSR_NX_REG       := w_data(0)
               FCSR_UF_REG       := w_data(1)
               FCSR_OF_REG       := w_data(2)
               FCSR_DZ_REG       := w_data(3)
               FCSR_NV_REG       := w_data(4)
               FCSR_FRM_REG      := w_data(7,5)
            }
            is(AddressMap.FFLAGS){
               FCSR_NX_REG       := w_data(0)
               FCSR_UF_REG       := w_data(1)
               FCSR_OF_REG       := w_data(2)
               FCSR_DZ_REG       := w_data(3)
               FCSR_NV_REG       := w_data(4)
            }
            is(AddressMap.FRM){
               FCSR_FRM_REG      := w_data(2,0)
            }
        }
    }
    /*************************************************/
    when (io.intrp_en){
        MSTATUS_MPIE_REG := MSTATUS_MIE_REG
        MSTATUS_MIE_REG  := 0.U
        MEPC_REG         := io.pc_address
        MSTATUS_MPP_REG  := "b11".U
    }

    io.MIE_Signal := MSTATUS_MIE_REG
}