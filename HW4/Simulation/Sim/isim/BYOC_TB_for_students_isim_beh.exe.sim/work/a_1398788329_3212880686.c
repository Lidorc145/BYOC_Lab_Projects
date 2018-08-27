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
static const char *ng0 = "C:/Users/Sherman/HW4_sim/MIPS_ALU.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_3499444699;
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_1306069469_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1697423399_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_3798478767_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_1398788329_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(52, ng0);

LAB3:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5248);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast(t1);

LAB2:    t7 = (t0 + 5104);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

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

LAB0:    xsi_set_current_line(54, ng0);

LAB3:    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 5312);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 5120);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1398788329_3212880686_p_2(char *t0)
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
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    int t17;
    int t18;
    int t19;
    char *t20;
    int t22;
    char *t23;
    int t25;
    char *t26;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;

LAB0:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 7684U);
    t3 = (t0 + 8056);
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
    t1 = (t0 + 7684U);
    t3 = (t0 + 8061);
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
        goto LAB5;

LAB6:    xsi_set_current_line(70, ng0);
    t1 = (t0 + 8111);
    t3 = (t0 + 5376);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    memcpy(t11, t1, 3U);
    xsi_driver_first_trans_fast(t3);

LAB3:    t1 = (t0 + 5136);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(59, ng0);
    t7 = (t0 + 8058);
    t12 = (t0 + 5376);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 3U);
    xsi_driver_first_trans_fast(t12);
    goto LAB3;

LAB5:    xsi_set_current_line(61, ng0);
    t7 = (t0 + 1192U);
    t11 = *((char **)t7);
    t7 = (t0 + 8063);
    t17 = xsi_mem_cmp(t7, t11, 6U);
    if (t17 == 1)
        goto LAB8;

LAB14:    t13 = (t0 + 8069);
    t18 = xsi_mem_cmp(t13, t11, 6U);
    if (t18 == 1)
        goto LAB9;

LAB15:    t15 = (t0 + 8075);
    t19 = xsi_mem_cmp(t15, t11, 6U);
    if (t19 == 1)
        goto LAB10;

LAB16:    t20 = (t0 + 8081);
    t22 = xsi_mem_cmp(t20, t11, 6U);
    if (t22 == 1)
        goto LAB11;

LAB17:    t23 = (t0 + 8087);
    t25 = xsi_mem_cmp(t23, t11, 6U);
    if (t25 == 1)
        goto LAB12;

LAB18:
LAB13:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 8108);
    t3 = (t0 + 5376);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    memcpy(t11, t1, 3U);
    xsi_driver_first_trans_fast(t3);

LAB7:    goto LAB3;

LAB8:    xsi_set_current_line(62, ng0);
    t26 = (t0 + 8093);
    t28 = (t0 + 5376);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    memcpy(t32, t26, 3U);
    xsi_driver_first_trans_fast(t28);
    goto LAB7;

LAB9:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 8096);
    t3 = (t0 + 5376);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    memcpy(t11, t1, 3U);
    xsi_driver_first_trans_fast(t3);
    goto LAB7;

LAB10:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 8099);
    t3 = (t0 + 5376);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    memcpy(t11, t1, 3U);
    xsi_driver_first_trans_fast(t3);
    goto LAB7;

LAB11:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 8102);
    t3 = (t0 + 5376);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    memcpy(t11, t1, 3U);
    xsi_driver_first_trans_fast(t3);
    goto LAB7;

LAB12:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 8105);
    t3 = (t0 + 5376);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    memcpy(t11, t1, 3U);
    xsi_driver_first_trans_fast(t3);
    goto LAB7;

LAB19:;
}

static void work_a_1398788329_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    int t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = ieee_std_logic_arith_conv_integer_ulogic(IEEE_P_3499444699, t3);
    t5 = (t4 == 1);
    if (t5 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 5440);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t1);

LAB3:    t1 = (t0 + 5152);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 1672U);
    t6 = *((char **)t1);
    t1 = (t0 + 5440);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t6, 32U);
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

}

static void work_a_1398788329_3212880686_p_4(char *t0)
{
    char t26[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    char *t15;
    int t16;
    char *t17;
    int t19;
    char *t20;
    int t22;
    char *t23;
    int t25;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned char t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;

LAB0:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 8114);
    t4 = xsi_mem_cmp(t1, t2, 3U);
    if (t4 == 1)
        goto LAB3;

LAB12:    t5 = (t0 + 8117);
    t7 = xsi_mem_cmp(t5, t2, 3U);
    if (t7 == 1)
        goto LAB4;

LAB13:    t8 = (t0 + 8120);
    t10 = xsi_mem_cmp(t8, t2, 3U);
    if (t10 == 1)
        goto LAB5;

LAB14:    t11 = (t0 + 8123);
    t13 = xsi_mem_cmp(t11, t2, 3U);
    if (t13 == 1)
        goto LAB6;

LAB15:    t14 = (t0 + 8126);
    t16 = xsi_mem_cmp(t14, t2, 3U);
    if (t16 == 1)
        goto LAB7;

LAB16:    t17 = (t0 + 8129);
    t19 = xsi_mem_cmp(t17, t2, 3U);
    if (t19 == 1)
        goto LAB8;

LAB17:    t20 = (t0 + 8132);
    t22 = xsi_mem_cmp(t20, t2, 3U);
    if (t22 == 1)
        goto LAB9;

LAB18:    t23 = (t0 + 8135);
    t25 = xsi_mem_cmp(t23, t2, 3U);
    if (t25 == 1)
        goto LAB10;

LAB19:
LAB11:    xsi_set_current_line(99, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 7796U);
    t3 = (t0 + 2472U);
    t5 = *((char **)t3);
    t3 = (t0 + 7812U);
    t6 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t26, t2, t1, t5, t3);
    t8 = (t26 + 12U);
    t33 = *((unsigned int *)t8);
    t34 = (1U * t33);
    t35 = (32U != t34);
    if (t35 == 1)
        goto LAB38;

LAB39:    t9 = (t0 + 5504);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 32U);
    xsi_driver_first_trans_fast(t9);

LAB2:    t1 = (t0 + 5168);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(87, ng0);
    t27 = (t0 + 2312U);
    t28 = *((char **)t27);
    t27 = (t0 + 7796U);
    t29 = (t0 + 2472U);
    t30 = *((char **)t29);
    t29 = (t0 + 7812U);
    t31 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t26, t28, t27, t30, t29);
    t32 = (t26 + 12U);
    t33 = *((unsigned int *)t32);
    t34 = (1U * t33);
    t35 = (32U != t34);
    if (t35 == 1)
        goto LAB21;

LAB22:    t36 = (t0 + 5504);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    memcpy(t40, t31, 32U);
    xsi_driver_first_trans_fast(t36);
    goto LAB2;

LAB4:    xsi_set_current_line(88, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 7796U);
    t3 = (t0 + 2472U);
    t5 = *((char **)t3);
    t3 = (t0 + 7812U);
    t6 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t26, t2, t1, t5, t3);
    t8 = (t26 + 12U);
    t33 = *((unsigned int *)t8);
    t34 = (1U * t33);
    t35 = (32U != t34);
    if (t35 == 1)
        goto LAB23;

LAB24:    t9 = (t0 + 5504);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 32U);
    xsi_driver_first_trans_fast(t9);
    goto LAB2;

LAB5:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 7796U);
    t3 = (t0 + 2472U);
    t5 = *((char **)t3);
    t3 = (t0 + 7812U);
    t6 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t26, t2, t1, t5, t3);
    t8 = (t26 + 12U);
    t33 = *((unsigned int *)t8);
    t34 = (1U * t33);
    t35 = (32U != t34);
    if (t35 == 1)
        goto LAB25;

LAB26:    t9 = (t0 + 5504);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 32U);
    xsi_driver_first_trans_fast(t9);
    goto LAB2;

LAB6:    xsi_set_current_line(90, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 7796U);
    t3 = (t0 + 2472U);
    t5 = *((char **)t3);
    t3 = (t0 + 7812U);
    t6 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t26, t2, t1, t5, t3);
    t8 = (t26 + 12U);
    t33 = *((unsigned int *)t8);
    t34 = (1U * t33);
    t35 = (32U != t34);
    if (t35 == 1)
        goto LAB27;

LAB28:    t9 = (t0 + 5504);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 32U);
    xsi_driver_first_trans_fast(t9);
    goto LAB2;

LAB7:    xsi_set_current_line(91, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 7796U);
    t3 = (t0 + 2472U);
    t5 = *((char **)t3);
    t3 = (t0 + 7812U);
    t6 = ieee_p_2592010699_sub_3798478767_503743352(IEEE_P_2592010699, t26, t2, t1, t5, t3);
    t8 = (t26 + 12U);
    t33 = *((unsigned int *)t8);
    t34 = (1U * t33);
    t35 = (32U != t34);
    if (t35 == 1)
        goto LAB29;

LAB30:    t9 = (t0 + 5504);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 32U);
    xsi_driver_first_trans_fast(t9);
    goto LAB2;

LAB8:    xsi_set_current_line(92, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 7796U);
    t3 = (t0 + 2472U);
    t5 = *((char **)t3);
    t3 = (t0 + 7812U);
    t6 = ieee_p_2592010699_sub_1306069469_503743352(IEEE_P_2592010699, t26, t2, t1, t5, t3);
    t8 = (t26 + 12U);
    t33 = *((unsigned int *)t8);
    t34 = (1U * t33);
    t35 = (32U != t34);
    if (t35 == 1)
        goto LAB31;

LAB32:    t9 = (t0 + 5504);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 32U);
    xsi_driver_first_trans_fast(t9);
    goto LAB2;

LAB9:    xsi_set_current_line(93, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 7796U);
    t3 = (t0 + 2472U);
    t5 = *((char **)t3);
    t3 = (t0 + 7812U);
    t6 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t26, t2, t1, t5, t3);
    t8 = (t26 + 12U);
    t33 = *((unsigned int *)t8);
    t34 = (1U * t33);
    t35 = (32U != t34);
    if (t35 == 1)
        goto LAB33;

LAB34:    t9 = (t0 + 5504);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 32U);
    xsi_driver_first_trans_fast(t9);
    goto LAB2;

LAB10:    xsi_set_current_line(94, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 7796U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t2, t1);
    t3 = (t0 + 2472U);
    t5 = *((char **)t3);
    t3 = (t0 + 7812U);
    t7 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t5, t3);
    t35 = (t4 < t7);
    if (t35 != 0)
        goto LAB35;

LAB37:    xsi_set_current_line(97, ng0);
    t1 = (t0 + 8170);
    t3 = (t0 + 5504);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast(t3);

LAB36:    goto LAB2;

LAB20:;
LAB21:    xsi_size_not_matching(32U, t34, 0);
    goto LAB22;

LAB23:    xsi_size_not_matching(32U, t34, 0);
    goto LAB24;

LAB25:    xsi_size_not_matching(32U, t34, 0);
    goto LAB26;

LAB27:    xsi_size_not_matching(32U, t34, 0);
    goto LAB28;

LAB29:    xsi_size_not_matching(32U, t34, 0);
    goto LAB30;

LAB31:    xsi_size_not_matching(32U, t34, 0);
    goto LAB32;

LAB33:    xsi_size_not_matching(32U, t34, 0);
    goto LAB34;

LAB35:    xsi_set_current_line(95, ng0);
    t6 = (t0 + 8138);
    t9 = (t0 + 5504);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 32U);
    xsi_driver_first_trans_fast(t9);
    goto LAB36;

LAB38:    xsi_size_not_matching(32U, t34, 0);
    goto LAB39;

}


extern void work_a_1398788329_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1398788329_3212880686_p_0,(void *)work_a_1398788329_3212880686_p_1,(void *)work_a_1398788329_3212880686_p_2,(void *)work_a_1398788329_3212880686_p_3,(void *)work_a_1398788329_3212880686_p_4};
	xsi_register_didat("work_a_1398788329_3212880686", "isim/BYOC_TB_for_students_isim_beh.exe.sim/work/a_1398788329_3212880686.didat");
	xsi_register_executes(pe);
}
