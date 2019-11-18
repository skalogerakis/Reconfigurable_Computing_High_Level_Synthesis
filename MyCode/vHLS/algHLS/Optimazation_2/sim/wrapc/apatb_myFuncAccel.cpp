// ==============================================================
// File generated on Mon Nov 18 23:04:44 EET 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:36:41 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================

#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;


// [dump_struct_tree [build_nameSpaceTree] dumpedStructList] ---------->


// [dump_enumeration [get_enumeration_list]] ---------->


// wrapc file define: "data0"
#define AUTOTB_TVIN_data0  "../tv/cdatafile/c.myFuncAccel.autotvin_data0.dat"
// wrapc file define: "data1"
#define AUTOTB_TVIN_data1  "../tv/cdatafile/c.myFuncAccel.autotvin_data1.dat"
// wrapc file define: "data2"
#define AUTOTB_TVOUT_data2  "../tv/cdatafile/c.myFuncAccel.autotvout_data2.dat"
#define AUTOTB_TVIN_data2  "../tv/cdatafile/c.myFuncAccel.autotvin_data2.dat"

#define INTER_TCL  "../tv/cdatafile/ref.tcl"

// tvout file define: "data2"
#define AUTOTB_TVOUT_PC_data2  "../tv/rtldatafile/rtl.myFuncAccel.autotvout_data2.dat"

class INTER_TCL_FILE {
	public:
		INTER_TCL_FILE(const char* name) {
			mName = name;
			data0_depth = 0;
			data1_depth = 0;
			data2_depth = 0;
			trans_num =0;
		}

		~INTER_TCL_FILE() {
			mFile.open(mName);
			if (!mFile.good()) {
				cout << "Failed to open file ref.tcl" << endl;
				exit (1);
			}
			string total_list = get_depth_list();
			mFile << "set depth_list {\n";
			mFile << total_list;
			mFile << "}\n";
			mFile << "set trans_num "<<trans_num<<endl;
			mFile.close();
		}

		string get_depth_list () {
			stringstream total_list;
			total_list << "{data0 " << data0_depth << "}\n";
			total_list << "{data1 " << data1_depth << "}\n";
			total_list << "{data2 " << data2_depth << "}\n";
			return total_list.str();
		}

		void set_num (int num , int* class_num) {
			(*class_num) = (*class_num) > num ? (*class_num) : num;
		}
	public:
		int data0_depth;
		int data1_depth;
		int data2_depth;
		int trans_num;

	private:
		ofstream mFile;
		const char* mName;
};

extern "C" void myFuncAccel (
int size,
int dim,
float threshold,
float* data0,
float* data1,
float* data2);

extern "C" void AESL_WRAP_myFuncAccel (
int size,
int dim,
float threshold,
float* data0,
float* data1,
float* data2)
{
	refine_signal_handler();
	fstream wrapc_switch_file_token;
	wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
	int AESL_i;
	if (wrapc_switch_file_token.good())
	{
		CodeState = ENTER_WRAPC_PC;
		static unsigned AESL_transaction_pc = 0;
		string AESL_token;
		string AESL_num;
		static AESL_FILE_HANDLER aesl_fh;


		// output port post check: "data2"
		aesl_fh.read(AUTOTB_TVOUT_PC_data2, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_data2, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_data2, AESL_token); // data

			sc_bv<32> *data2_pc_buffer = new sc_bv<32>[4000];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'data2', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'data2', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					data2_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_data2, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_data2))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: data2
				{
					// bitslice(31, 0)
					// {
						// celement: data2(31, 0)
						// {
							sc_lv<32>* data2_lv0_0_3999_1 = new sc_lv<32>[4000];
						// }
					// }

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: data2(31, 0)
						{
							// carray: (0) => (3999) @ (1)
							for (int i_0 = 0; i_0 <= 3999; i_0 += 1)
							{
								if (&(data2[0]) != NULL) // check the null address if the c port is array or others
								{
									data2_lv0_0_3999_1[hls_map_index].range(31, 0) = sc_bv<32>(data2_pc_buffer[hls_map_index].range(31, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: data2(31, 0)
						{
							// carray: (0) => (3999) @ (1)
							for (int i_0 = 0; i_0 <= 3999; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : data2[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : data2[0]
								// output_left_conversion : *(int*)&data2[i_0]
								// output_type_conversion : (data2_lv0_0_3999_1[hls_map_index]).to_uint64()
								if (&(data2[0]) != NULL) // check the null address if the c port is array or others
								{
									*(int*)&data2[i_0] = (data2_lv0_0_3999_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] data2_pc_buffer;
		}

		AESL_transaction_pc++;
	}
	else
	{
		CodeState = ENTER_WRAPC;
		static unsigned AESL_transaction;

		static AESL_FILE_HANDLER aesl_fh;

		// "data0"
		char* tvin_data0 = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_data0);

		// "data1"
		char* tvin_data1 = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_data1);

		// "data2"
		char* tvin_data2 = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_data2);
		char* tvout_data2 = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_data2);

		CodeState = DUMP_INPUTS;
		static INTER_TCL_FILE tcl_file(INTER_TCL);
		int leading_zero;

		// [[transaction]]
		sprintf(tvin_data0, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_data0, tvin_data0);

		sc_bv<32>* data0_tvin_wrapc_buffer = new sc_bv<32>[16];

		// RTL Name: data0
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: data0(31, 0)
				{
					// carray: (0) => (15) @ (1)
					for (int i_0 = 0; i_0 <= 15; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : data0[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : data0[0]
						// regulate_c_name       : data0
						// input_type_conversion : *(int*)&data0[i_0]
						if (&(data0[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> data0_tmp_mem;
							data0_tmp_mem = *(int*)&data0[i_0];
							data0_tvin_wrapc_buffer[hls_map_index].range(31, 0) = data0_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 16; i++)
		{
			sprintf(tvin_data0, "%s\n", (data0_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_data0, tvin_data0);
		}

		tcl_file.set_num(16, &tcl_file.data0_depth);
		sprintf(tvin_data0, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_data0, tvin_data0);

		// release memory allocation
		delete [] data0_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_data1, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_data1, tvin_data1);

		sc_bv<32>* data1_tvin_wrapc_buffer = new sc_bv<32>[4000];

		// RTL Name: data1
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: data1(31, 0)
				{
					// carray: (0) => (3999) @ (1)
					for (int i_0 = 0; i_0 <= 3999; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : data1[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : data1[0]
						// regulate_c_name       : data1
						// input_type_conversion : *(int*)&data1[i_0]
						if (&(data1[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> data1_tmp_mem;
							data1_tmp_mem = *(int*)&data1[i_0];
							data1_tvin_wrapc_buffer[hls_map_index].range(31, 0) = data1_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 4000; i++)
		{
			sprintf(tvin_data1, "%s\n", (data1_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_data1, tvin_data1);
		}

		tcl_file.set_num(4000, &tcl_file.data1_depth);
		sprintf(tvin_data1, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_data1, tvin_data1);

		// release memory allocation
		delete [] data1_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_data2, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_data2, tvin_data2);

		sc_bv<32>* data2_tvin_wrapc_buffer = new sc_bv<32>[4000];

		// RTL Name: data2
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: data2(31, 0)
				{
					// carray: (0) => (3999) @ (1)
					for (int i_0 = 0; i_0 <= 3999; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : data2[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : data2[0]
						// regulate_c_name       : data2
						// input_type_conversion : *(int*)&data2[i_0]
						if (&(data2[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> data2_tmp_mem;
							data2_tmp_mem = *(int*)&data2[i_0];
							data2_tvin_wrapc_buffer[hls_map_index].range(31, 0) = data2_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 4000; i++)
		{
			sprintf(tvin_data2, "%s\n", (data2_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_data2, tvin_data2);
		}

		tcl_file.set_num(4000, &tcl_file.data2_depth);
		sprintf(tvin_data2, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_data2, tvin_data2);

		// release memory allocation
		delete [] data2_tvin_wrapc_buffer;

// [call_c_dut] ---------->

		CodeState = CALL_C_DUT;
		myFuncAccel(size, dim, threshold, data0, data1, data2);

		CodeState = DUMP_OUTPUTS;

		// [[transaction]]
		sprintf(tvout_data2, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_data2, tvout_data2);

		sc_bv<32>* data2_tvout_wrapc_buffer = new sc_bv<32>[4000];

		// RTL Name: data2
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: data2(31, 0)
				{
					// carray: (0) => (3999) @ (1)
					for (int i_0 = 0; i_0 <= 3999; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : data2[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : data2[0]
						// regulate_c_name       : data2
						// input_type_conversion : *(int*)&data2[i_0]
						if (&(data2[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> data2_tmp_mem;
							data2_tmp_mem = *(int*)&data2[i_0];
							data2_tvout_wrapc_buffer[hls_map_index].range(31, 0) = data2_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 4000; i++)
		{
			sprintf(tvout_data2, "%s\n", (data2_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_data2, tvout_data2);
		}

		tcl_file.set_num(4000, &tcl_file.data2_depth);
		sprintf(tvout_data2, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_data2, tvout_data2);

		// release memory allocation
		delete [] data2_tvout_wrapc_buffer;

		CodeState = DELETE_CHAR_BUFFERS;
		// release memory allocation: "data0"
		delete [] tvin_data0;
		// release memory allocation: "data1"
		delete [] tvin_data1;
		// release memory allocation: "data2"
		delete [] tvout_data2;
		delete [] tvin_data2;

		AESL_transaction++;

		tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
	}
}

