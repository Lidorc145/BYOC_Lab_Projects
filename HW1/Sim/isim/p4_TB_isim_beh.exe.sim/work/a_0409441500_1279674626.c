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
static const char *ng0 = "C:/Users/User/p4/ck_divider.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


static void work_a_0409441500_1279674626_p_0(char *t0)
{
    char t9[16];
    char t11[16];
    char t16[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t10;
    char *t12;
    char *t13;
    int t14;
    unsigned int t15;
    char *t17;
    int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned char t24;
    unsigned int t25;
    unsigned char t26;

LAB0:    xsi_set_current_line(25, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB9;

LAB10:    t3 = (unsigned char)0;

LAB11:    if (t3 != 0)
        goto LAB7;

LAB8:
LAB3:    t1 = (t0 + 3240);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(26, ng0);
    t1 = (t0 + 5035);
    t6 = (t0 + 5036);
    t10 = ((IEEE_P_2592010699) + 4024);
    t12 = (t11 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 0;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t14 = (0 - 0);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t15;
    t13 = (t16 + 0U);
    t17 = (t13 + 0U);
    *((int *)t17) = 0;
    t17 = (t13 + 4U);
    *((int *)t17) = 23;
    t17 = (t13 + 8U);
    *((int *)t17) = 1;
    t18 = (23 - 0);
    t15 = (t18 * 1);
    t15 = (t15 + 1);
    t17 = (t13 + 12U);
    *((unsigned int *)t17) = t15;
    t8 = xsi_base_array_concat(t8, t9, t10, (char)97, t1, t11, (char)97, t6, t16, (char)101);
    t15 = (1U + 24U);
    t19 = (25U != t15);
    if (t19 == 1)
        goto LAB5;

LAB6:    t17 = (t0 + 3336);
    t20 = (t17 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t8, 25U);
    xsi_driver_first_trans_fast(t17);
    goto LAB3;

LAB5:    xsi_size_not_matching(25U, t15, 0);
    goto LAB6;

LAB7:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1512U);
    t6 = *((char **)t2);
    t2 = (t0 + 4984U);
    t7 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t9, t6, t2, 1);
    t8 = (t9 + 12U);
    t15 = *((unsigned int *)t8);
    t25 = (1U * t15);
    t26 = (25U != t25);
    if (t26 == 1)
        goto LAB12;

LAB13:    t10 = (t0 + 3336);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t17 = (t13 + 56U);
    t20 = *((char **)t17);
    memcpy(t20, t7, 25U);
    xsi_driver_first_trans_fast(t10);
    goto LAB3;

LAB9:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t19 = *((unsigned char *)t5);
    t24 = (t19 == (unsigned char)3);
    t3 = t24;
    goto LAB11;

LAB12:    xsi_size_not_matching(25U, t25, 0);
    goto LAB13;

}

static void work_a_0409441500_1279674626_p_1(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(32, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = (23 - 24);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 3400);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t7;
    xsi_driver_first_trans_fast_port(t8);

LAB2:    t13 = (t0 + 3256);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0409441500_1279674626_init()
{
	static char *pe[] = {(void *)work_a_0409441500_1279674626_p_0,(void *)work_a_0409441500_1279674626_p_1};
	xsi_register_didat("work_a_0409441500_1279674626", "isim/p4_TB_isim_beh.exe.sim/work/a_0409441500_1279674626.didat");
	xsi_register_executes(pe);
}
