/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Sherman/HW3_MIPS_ALU/MIPS_ALU.VHD";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_1697423399_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_1398788329_3212880686_p_0(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    char *t15;
    int t16;
    char *t17;
    char *t18;
    int t19;
    char *t20;
    int t22;
    char *t23;
    int t25;
    char *t26;
    int t28;
    char *t29;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;

LAB0:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 7392U);
    t3 = (t0 + 7764);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 1;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (1 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 7392U);
    t3 = (t0 + 7823);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 1;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (1 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB20;

LAB21:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 7392U);
    t3 = (t0 + 7828);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 1;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (1 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB22;

LAB23:
LAB3:    t1 = (t0 + 4856);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(54, ng0);
    t7 = (t0 + 1192U);
    t11 = *((char **)t7);
    t7 = (t0 + 7766);
    t13 = xsi_mem_cmp(t7, t11, 6U);
    if (t13 == 1)
        goto LAB6;

LAB13:    t14 = (t0 + 7772);
    t16 = xsi_mem_cmp(t14, t11, 6U);
    if (t16 == 1)
        goto LAB7;

LAB14:    t17 = (t0 + 7778);
    t19 = xsi_mem_cmp(t17, t11, 6U);
    if (t19 == 1)
        goto LAB8;

LAB15:    t20 = (t0 + 7784);
    t22 = xsi_mem_cmp(t20, t11, 6U);
    if (t22 == 1)
        goto LAB9;

LAB16:    t23 = (t0 + 7790);
    t25 = xsi_mem_cmp(t23, t11, 6U);
    if (t25 == 1)
        goto LAB10;

LAB17:    t26 = (t0 + 7796);
    t28 = xsi_mem_cmp(t26, t11, 6U);
    if (t28 == 1)
        goto LAB11;

LAB18:
LAB12:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 7820);
    t3 = (t0 + 4984);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    memcpy(t11, t1, 3U);
    xsi_driver_first_trans_fast(t3);

LAB5:    goto LAB3;

LAB6:    xsi_set_current_line(56, ng0);
    t29 = (t0 + 7802);
    t31 = (t0 + 4984);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    memcpy(t35, t29, 3U);
    xsi_driver_first_trans_fast(t31);
    goto LAB5;

LAB7:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 7805);
    t3 = (t0 + 4984);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    memcpy(t11, t1, 3U);
    xsi_driver_first_trans_fast(t3);
    goto LAB5;

LAB8:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 7808);
    t3 = (t0 + 4984);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    memcpy(t11, t1, 3U);
    xsi_driver_first_trans_fast(t3);
    goto LAB5;

LAB9:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 7811);
    t3 = (t0 + 4984);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    memcpy(t11, t1, 3U);
    xsi_driver_first_trans_fast(t3);
    goto LAB5;

LAB10:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 7814);
    t3 = (t0 + 4984);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    memcpy(t11, t1, 3U);
    xsi_driver_first_trans_fast(t3);
    goto LAB5;

LAB11:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 7817);
    t3 = (t0 + 4984);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    memcpy(t11, t1, 3U);
    xsi_driver_first_trans_fast(t3);
    goto LAB5;

LAB19:;
LAB20:    xsi_set_current_line(65, ng0);
    t7 = (t0 + 7825);
    t12 = (t0 + 4984);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t17 = (t15 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t7, 3U);
    xsi_driver_first_trans_fast(t12);
    goto LAB3;

LAB22:    xsi_set_current_line(67, ng0);
    t7 = (t0 + 7830);
    t12 = (t0 + 4984);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t17 = (t15 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t7, 3U);
    xsi_driver_first_trans_fast(t12);
    goto LAB3;

}

static void work_a_1398788329_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(72, ng0);

LAB3:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5048);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast(t1);

LAB2:    t7 = (t0 + 4872);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1398788329_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 5112);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 32U);
    xsi_driver_first_trans_fast(t1);

LAB3:    t1 = (t0 + 4888);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 1512U);
    t5 = *((char **)t1);
    t1 = (t0 + 5112);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 32U);
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

}

static void work_a_1398788329_3212880686_p_3(char *t0)
{
    char t5[16];
    char t11[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    int t24;
    int t25;

LAB0:    xsi_set_current_line(87, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 7488U);
    t3 = (t0 + 7833);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 2;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (2 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 7488U);
    t3 = (t0 + 7836);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 2;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (2 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB7;

LAB8:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 7488U);
    t3 = (t0 + 7839);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 2;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (2 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB11;

LAB12:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 7488U);
    t3 = (t0 + 7842);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 2;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (2 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB15;

LAB16:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 7488U);
    t3 = (t0 + 7845);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 2;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (2 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB19;

LAB20:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 7488U);
    t3 = (t0 + 7848);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 2;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (2 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB23;

LAB24:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 7915);
    t3 = (t0 + 5176);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t12 = *((char **)t7);
    memcpy(t12, t1, 32U);
    xsi_driver_first_trans_fast_port(t3);

LAB3:    t1 = (t0 + 4904);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(88, ng0);
    t7 = (t0 + 2312U);
    t12 = *((char **)t7);
    t7 = (t0 + 7504U);
    t13 = (t0 + 2472U);
    t14 = *((char **)t13);
    t13 = (t0 + 7520U);
    t15 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t11, t12, t7, t14, t13);
    t16 = (t11 + 12U);
    t9 = *((unsigned int *)t16);
    t17 = (1U * t9);
    t18 = (32U != t17);
    if (t18 == 1)
        goto LAB5;

LAB6:    t19 = (t0 + 5176);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t15, 32U);
    xsi_driver_first_trans_fast_port(t19);
    goto LAB3;

LAB5:    xsi_size_not_matching(32U, t17, 0);
    goto LAB6;

LAB7:    xsi_set_current_line(90, ng0);
    t7 = (t0 + 2312U);
    t12 = *((char **)t7);
    t7 = (t0 + 7504U);
    t13 = (t0 + 2472U);
    t14 = *((char **)t13);
    t13 = (t0 + 7520U);
    t15 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t11, t12, t7, t14, t13);
    t16 = (t11 + 12U);
    t9 = *((unsigned int *)t16);
    t17 = (1U * t9);
    t18 = (32U != t17);
    if (t18 == 1)
        goto LAB9;

LAB10:    t19 = (t0 + 5176);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t15, 32U);
    xsi_driver_first_trans_fast_port(t19);
    goto LAB3;

LAB9:    xsi_size_not_matching(32U, t17, 0);
    goto LAB10;

LAB11:    xsi_set_current_line(92, ng0);
    t7 = (t0 + 2312U);
    t12 = *((char **)t7);
    t7 = (t0 + 7504U);
    t13 = (t0 + 2472U);
    t14 = *((char **)t13);
    t13 = (t0 + 7520U);
    t15 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t11, t12, t7, t14, t13);
    t16 = (t11 + 12U);
    t9 = *((unsigned int *)t16);
    t17 = (1U * t9);
    t18 = (32U != t17);
    if (t18 == 1)
        goto LAB13;

LAB14:    t19 = (t0 + 5176);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t15, 32U);
    xsi_driver_first_trans_fast_port(t19);
    goto LAB3;

LAB13:    xsi_size_not_matching(32U, t17, 0);
    goto LAB14;

LAB15:    xsi_set_current_line(94, ng0);
    t7 = (t0 + 2312U);
    t12 = *((char **)t7);
    t7 = (t0 + 7504U);
    t13 = (t0 + 2472U);
    t14 = *((char **)t13);
    t13 = (t0 + 7520U);
    t15 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t11, t12, t7, t14, t13);
    t16 = (t11 + 12U);
    t9 = *((unsigned int *)t16);
    t17 = (1U * t9);
    t18 = (32U != t17);
    if (t18 == 1)
        goto LAB17;

LAB18:    t19 = (t0 + 5176);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t15, 32U);
    xsi_driver_first_trans_fast_port(t19);
    goto LAB3;

LAB17:    xsi_size_not_matching(32U, t17, 0);
    goto LAB18;

LAB19:    xsi_set_current_line(96, ng0);
    t7 = (t0 + 2312U);
    t12 = *((char **)t7);
    t7 = (t0 + 7504U);
    t13 = (t0 + 2472U);
    t14 = *((char **)t13);
    t13 = (t0 + 7520U);
    t15 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t11, t12, t7, t14, t13);
    t16 = (t11 + 12U);
    t9 = *((unsigned int *)t16);
    t17 = (1U * t9);
    t18 = (32U != t17);
    if (t18 == 1)
        goto LAB21;

LAB22:    t19 = (t0 + 5176);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t15, 32U);
    xsi_driver_first_trans_fast_port(t19);
    goto LAB3;

LAB21:    xsi_size_not_matching(32U, t17, 0);
    goto LAB22;

LAB23:    xsi_set_current_line(98, ng0);
    t7 = (t0 + 2312U);
    t12 = *((char **)t7);
    t7 = (t0 + 7504U);
    t24 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t12, t7);
    t13 = (t0 + 2472U);
    t14 = *((char **)t13);
    t13 = (t0 + 7520U);
    t25 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t14, t13);
    t18 = (t24 < t25);
    if (t18 != 0)
        goto LAB25;

LAB27:    xsi_set_current_line(101, ng0);
    t1 = (t0 + 7883);
    t3 = (t0 + 5176);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t12 = *((char **)t7);
    memcpy(t12, t1, 32U);
    xsi_driver_first_trans_fast_port(t3);

LAB26:    goto LAB3;

LAB25:    xsi_set_current_line(99, ng0);
    t15 = (t0 + 7851);
    t19 = (t0 + 5176);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t15, 32U);
    xsi_driver_first_trans_fast_port(t19);
    goto LAB26;

}


extern void work_a_1398788329_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1398788329_3212880686_p_0,(void *)work_a_1398788329_3212880686_p_1,(void *)work_a_1398788329_3212880686_p_2,(void *)work_a_1398788329_3212880686_p_3};
	xsi_register_didat("work_a_1398788329_3212880686", "isim/MIPS_ALU_TB_isim_beh.exe.sim/work/a_1398788329_3212880686.didat");
	xsi_register_executes(pe);
}
