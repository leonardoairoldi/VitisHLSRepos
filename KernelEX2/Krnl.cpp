#include "string.h"
#include "stdio.h"

extern "C" {
    void kernel_body(double S[121], double D[1331], double u[1331], double v[1331], double t[1331], double r[1331], double t1[1331], double t3[1331], double t0[1331], double t2[1331])
    {
        LOOP_1_1:for (int c1 = 0; c1 <= 10; c1 += 1)
            LOOP_1_2:for (int c2 = 0; c2 <= 10; c2 += 1)
                LOOP_1_3:for (int c3 = 0; c3 <= 10; c3 += 1) {
                    // stmt0
                    t1[121 * c1 + 11 * c2 + c3] = 0;
                    for (int c8 = 0; c8 <= 10; c8 += 1)
                        // stmt0
                        t1[121 * c1 + 11 * c2 + c3] = t1[121 * c1 + 11 * c2 + c3] + S[11 * c1 + c8] * u[121 * c2 + 11 * c3 + c8];
                }
        LOOP_2_1:for (int c1 = 0; c1 <= 10; c1 += 1)
            LOOP_2_2:for (int c2 = 0; c2 <= 10; c2 += 1)
                LOOP_2_3:for (int c3 = 0; c3 <= 10; c3 += 1) {
                    // stmt1
                    t0[121 * c1 + 11 * c2 + c3] = 0;
                    for (int c8 = 0; c8 <= 10; c8 += 1)
                        // stmt1
                        t0[121 * c1 + 11 * c2 + c3] = t0[121 * c1 + 11 * c2 + c3] + S[11 * c1 + c8] * t1[121 * c2 + 11 * c3 + c8];
                }
        LOOP_3_1:for (int c1 = 0; c1 <= 10; c1 += 1)
            LOOP_3_2:for (int c2 = 0; c2 <= 10; c2 += 1)
                LOOP_3_3:for (int c3 = 0; c3 <= 10; c3 += 1) {
                    // stmt2
                    t[121 * c1 + 11 * c2 + c3] = 0;
                    for (int c8 = 0; c8 <= 10; c8 += 1)
                        // stmt2
                        t[121 * c1 + 11 * c2 + c3] = t[121 * c1 + 11 * c2 + c3] + S[11 * c1 + c8] * t0[121 * c2 + 11 * c3 + c8];
                }
        LOOP_4_1:for (int c1 = 0; c1 <= 10; c1 += 1)
            LOOP_4_2:for (int c2 = 0; c2 <= 10; c2 += 1)
                LOOP_4_3:for (int c3 = 0; c3 <= 10; c3 += 1)
                    // stmt3
                    r[121 * c1 + 11 * c2 + c3] = D[121 * c1 + 11 * c2 + c3] * t[121 * c1 + 11 * c2 + c3];
        LOOP_5_1:for (int c1 = 0; c1 <= 10; c1 += 1)
            LOOP_5_2:for (int c2 = 0; c2 <= 10; c2 += 1)
                LOOP_5_3:for (int c3 = 0; c3 <= 10; c3 += 1) {
                    // stmt4
                    t3[121 * c1 + 11 * c2 + c3] = 0;
                    for (int c8 = 0; c8 <= 10; c8 += 1)
                        // stmt4
                        t3[121 * c1 + 11 * c2 + c3] = t3[121 * c1 + 11 * c2 + c3] + S[c1 + 11 * c8] * r[121 * c2 + 11 * c3 + c8];
                }
        LOOP_6_1:for (int c1 = 0; c1 <= 10; c1 += 1)
            LOOP_6_2:for (int c2 = 0; c2 <= 10; c2 += 1)
                LOOP_6_3:for (int c3 = 0; c3 <= 10; c3 += 1) {
                    // stmt5
                    t2[121 * c1 + 11 * c2 + c3] = 0;
                    for (int c8 = 0; c8 <= 10; c8 += 1)
                        // stmt5
                        t2[121 * c1 + 11 * c2 + c3] = t2[121 * c1 + 11 * c2 + c3] + S[c1 + 11 * c8] * t3[121 * c2 + 11 * c3 + c8];
                }
        LOOP_7_1:for (int c1 = 0; c1 <= 10; c1 += 1)
            LOOP_7_2:for (int c2 = 0; c2 <= 10; c2 += 1)
                LOOP_7_3:for (int c3 = 0; c3 <= 10; c3 += 1) {
                    // stmt6
                    v[121 * c1 + 11 * c2 + c3] = 0;
                    for (int c8 = 0; c8 <= 10; c8 += 1)
                        // stmt6
                        v[121 * c1 + 11 * c2 + c3] = v[121 * c1 + 11 * c2 + c3] + S[c1 + 11 * c8] * t2[121 * c2 + 11 * c3 + c8];
                }
    }

    void krnl_helm(double* in, double* out, const unsigned int num_times)
    {   
    #pragma HLS INTERFACE m_axi port=in offset=slave bundle=gmem0
    #pragma HLS INTERFACE m_axi port=out offset=slave bundle=gmem1

    #pragma HLS INTERFACE s_axilite port=in bundle=control
    #pragma HLS INTERFACE s_axilite port=out bundle=control
    
    #pragma HLS INTERFACE s_axilite port=num_times bundle=control
    #pragma HLS INTERFACE s_axilite port=return bundle=control



    	double buf_S[121];
        double buf_D[1331];
        double buf_u[1331];
        double buf_v[1331];
        double t[1331];
        double r[1331];
        double t1[1331];
        double t3[1331];
        double t0[1331];
        double t2[1331];

        /*
		#pragma HLS bind_storage variable=buf_S type=RAM_2P
		#pragma HLS bind_storage variable=buf_D type=RAM_2P
		#pragma HLS bind_storage variable=buf_u type=RAM_2P
		#pragma HLS bind_storage variable=buf_v type=RAM_2P
		#pragma HLS bind_storage variable=t type=RAM_2P
		#pragma HLS bind_storage variable=r type=RAM_2P
		#pragma HLS bind_storage variable=t1 type=RAM_2P
		#pragma HLS bind_storage variable=t3 type=RAM_2P
		#pragma HLS bind_storage variable=t0 type=RAM_2P
		#pragma HLS bind_storage variable=t2 type=RAM_2P
		*/

        for (int count = 0; count < num_times; count++) 
        {
			#pragma HLS loop_tripcount min=5 max=15 avg=10
            memcpy(buf_S, &in[2783*count], 121*sizeof(double));  
            memcpy(buf_u, &in[2783*count+121], 1331*sizeof(double));
            memcpy(buf_D, &in[2783*count+121+1331], 1331*sizeof(double));
          
            kernel_body(buf_S, buf_D, buf_u, buf_v, t, r, t1, t3, t0, t2);

            memcpy(&out[1331*count], buf_v, 1331*sizeof(double));
        }
        return;
    }

}
