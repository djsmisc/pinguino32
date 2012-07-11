#ifndef __MATH_C
#define __MATH_C

#define _REENTRANT

#define _IL_REENTRANT
#define _FS_REENTRANT
#define _MATH_REENTRANT

#define _CODE	__code
#define _DATA	__data
#define _AUTOMEM
#define _STATMEM

//#define PI          3.1415926536
//#define TWO_PI      6.2831853071
//#define HALF_PI     1.5707963268
#define QUART_PI    0.7853981634
#define iPI         0.3183098862
#define iTWO_PI     0.1591549431
#define TWO_O_PI    0.6366197724

// EPS=B**(-t/2), where B is the radix of the doubleing-point representation
// and there are t base-B digits in the significand.  Therefore, for doubles
// EPS=2**(-12).  Also define EPS2=EPS*EPS.
#define EPS 244.14062E-6
#define EPS2 59.6046E-9
#define XMAX 3.402823466E+38

union double_long
{
    double f;
    long l;
};

/**********************************************
 * Prototypes for double ANSI C math functions *
 **********************************************/

/* Trigonometric functions */
double sinf(const double x) _MATH_REENTRANT;
double cosf(const double x) _MATH_REENTRANT;
double tanf(const double x) _MATH_REENTRANT;
double cotf(const double x) _MATH_REENTRANT;
double asinf(const double x) _MATH_REENTRANT;
double acosf(const double x) _MATH_REENTRANT;
double atanf(const double x) _MATH_REENTRANT;
double atan2f(const double x, const double y);

/* Hyperbolic functions */
double sinhf(const double x) _MATH_REENTRANT;
double coshf(const double x) _MATH_REENTRANT;
double tanhf(const double x) _MATH_REENTRANT;

/* Exponential, logarithmic and power functions */
double expf(const double x);
double logf(const double x) _MATH_REENTRANT;
double log10f(const double x) _MATH_REENTRANT;
double powf(const double x, const double y);
double sqrtf(const double a) _MATH_REENTRANT;

/* Nearest integer, absolute value, and remainder functions */
double fabsf(const double x) _MATH_REENTRANT;
double frexpf(const double x, int *pw2);
double ldexpf(const double x, const int pw2);
double ceilf(double x) _MATH_REENTRANT;
double floorf(double x) _MATH_REENTRANT;
double modff(double x, double * y);

#define P0  0.2499999995E+0
#define P1  0.933935835E+0
#define P2 -0.504400557E+0
#define Q0  0.560363004E+1
#define Q1 -0.554846723E+1
#define Q2  0.100000000E+1

#define P(g) (P2*g+P1)
#define Q(g) ((Q2*g+Q1)*g+Q0)

#define P1      0.4160288626E-2
#define Q0      0.5000000000E+0
#define Q1      0.4998717877E-1

#define P(z) ((P1*z)+P0)
#define Q(z) ((Q1*z)+Q0)

/*Constans for 24 bits or less (8 decimal digits)*/
#define A0 -0.5527074855E+0
#define B0 -0.6632718214E+1
#define A(w) (A0)
#define B(w) (w+B0)

#define C0  0.70710678118654752440
#define C1  0.693359375 /*355.0/512.0*/
#define C2 -2.1219444005469058277e-4

#define BIGX    88.72283911  /* ln(XMAX) */
#define EXPEPS  1.0E-7       /* exp(1.0E-7)=0.0000001 */
#define K1      1.4426950409 /* 1/ln(2) */

#define r1      (-0.1666665668E+0)
#define r2      (0.8333025139E-2)
#define r3      (-0.1980741872E-3)
#define r4       (0.2601903036E-5)

/* PI=pC1+pC2 */
#define pC1       3.140625
#define pC2       9.676535897E-4

/*A reasonable value for YMAX is the int part of PI*B**(t/2)=3.1416*2**(12)*/
#define YMAX     12867.0

#define scP0 -0.713793159E+1
#define scP1 -0.190333999E+0
#define scQ0 -0.428277109E+2
#define scQ1  0.100000000E+1

#define scP(z) (scP1*z+scP0)
#define scQ(z) (scQ1*z+scQ0)

#define K1 0.69316101074218750000E+0 /* ln(v)   */
#define K2 0.24999308500451499336E+0 /* v**(-2) */
#define K3 0.13830277879601902638E-4 /* v/2-1   */

//WMAX is defined as ln(XMAX)-ln(v)+0.69
#define WMAX 44.93535952E+0
//WBAR 0.35*(b+1)
#define WBAR 1.05
#define YBAR 9.0 /*Works for me*/

#define tcP0  0.100000000E+1
#define tcP1 -0.958017723E-1
#define tcQ0  0.100000000E+1
#define tcQ1 -0.429135777E+0
#define tcQ2  0.971685835E-2

#define tcC1  1.5703125
#define tcC2  4.83826794897E-4

#define tcP(f,g) (tcP1*g*f+f)
#define tcQ(g) ((tcQ2*g+tcQ1)*g+tcQ0)

//A reasonable choice for YMAX is the integer part of B**(t/2)*PI/2:
#define YMAX 6433.0

#define tP0 -0.8237728127E+0
#define tP1 -0.3831010665E-2
#define tQ0  0.2471319654E+1
#define tQ1  0.1000000000E+1

/* ln(3)/2 */
#define tK1  0.5493061443E+0
/* SBIG=[ln(2)+(t+1)*ln(B)]/2 */
#define SBIG 9.01091

#define tP(g) ((tP1*g+tP0)*g)
#define tQ(g) (tQ1*g+tQ0)

double tanhf(const double x) _MATH_REENTRANT
{
    double f, g, r;

    f=fabsf(x);
    if(f>SBIG) r=1.0;
    else if(f>tK1)
    {
        r=0.5-1.0/(expf(f+f)+1.0);
        r+=r;
    }
    else if(f<EPS) r=f;
    else
    {
        g=f*f;
        r=f+f*(tP(g)/tQ(g));
    }
    if(x<0.0) r=-r;
    return r;
}

double tanf(const double x) _MATH_REENTRANT
{
    return tancotf(x, 0);
}

double tancotf(const double x, const int iscotan)
{
    double f, g, xn, xnum, xden;
    int n;

    if (fabsf(x) > YMAX)
    {
        return 0.0;
    }

    /*Round x*2*PI to the nearest integer*/
    n=(x*TWO_O_PI+(x>0.0?0.5:-0.5)); /*works for +-x*/
    xn=n;

    xnum=(int)x;
    xden=x-xnum;
    f=((xnum-xn*tcC1)+xden)-xn*tcC2;

    if (fabsf(f) < EPS)
    {
        xnum = f;
        xden = 1.0;
    }
    else
    {
        g = f*f;
        xnum = tcP(f,g);
        xden = tcQ(g);
    }

    if(n&1)
    //xn is odd
    {
        if(iscotan) return (-xnum/xden);
               else return (-xden/xnum);
    }
    else
    {
        if(iscotan) return (xden/xnum);
               else return (xnum/xden);
    }
}

double sqrtf(const double x) _MATH_REENTRANT
{
    double f, y;
    int n;

    if (x==0.0) return x;
    else if (x==1.0) return 1.0;
    else if (x<0.0)
    {
        return 0.0;
    }
    f=frexpf(x, &n);
    y=0.41731+0.59016*f; /*Educated guess*/
    /*For a 24 bit mantisa (double), two iterations are sufficient*/
    y+=f/y;
    y=ldexpf(y, -2) + f/y; /*Faster version of 0.25 * y + f/y*/

    if (n&1)
    {
        y*=0.7071067812;
        ++n;
    }
    return ldexpf(y, n/2);
}

double sinhf(const double x) _MATH_REENTRANT
{
    return sincoshf(x, 0);
}

double sinf(double x) _MATH_REENTRANT
{
    if (x==0.0) return 0.0;
    return sincosf(x, 0);
}

double sincoshf(const double x, const int iscosh)
{
    double y, w, z;
    char sign;
    
    if (x<0.0) { y=-x; sign=1; }
          else { y=x;  sign=0; }

    if ((y>1.0) || iscosh)
    {
        if(y>YBAR)
        {
            w=y-K1;
            if (w>WMAX)
            {
                z=XMAX;
            }
            else
            {
                z=expf(w);
                z+=K3*z;
            }
        }
        else
        {
            z=expf(y);
            w=1.0/z;
            if(!iscosh) w=-w;
            z=(z+w)*0.5;
        }
        if(sign) z=-z;
    }
    else
    {
        if (y<EPS)
            z=x;
        else
        {
            z=x*x;
            z=x+x*z*scP(z)/scQ(z);
        }
    }
    return z;
}

double sincosf(double x, int iscos)
{
    double y, f, r, g, XN;
    int N;
    char sign;

    if(iscos)
    {
        y=fabsf(x)+HALF_PI;
        sign=0;
    }
    else
    {
        if(x<0.0)
            { y=-x; sign=1; }
        else
            { y=x; sign=0; }
    }

    if(y>YMAX)
    {
        return 0.0;
    }

    /*Round y/PI to the nearest integer*/
    N=((y*iPI)+0.5); /*y is positive*/

    /*If N is odd change sign*/
    if(N&1) sign=!sign;

    XN=N;
    /*Cosine required? (is done here to keep accuracy)*/
    if(iscos) XN-=0.5;

    y=fabsf(x);
    r=(int)y;
    g=y-r;
    f=((r-XN*pC1)+g)-XN*pC2;

    g=f*f;
    if(g>EPS2) //Used to be if(fabsf(f)>EPS)
    {
        r=(((r4*g+r3)*g+r2)*g+r1)*g;
        f+=f*r;
    }
    return (sign?-f:f);
}

double powf(const double x, const double y)
{
    if(y == 0.0) return 1.0;
    if(y==1.0) return x;
    if(x <= 0.0) return 0.0;
    return expf(logf(x) * y);
}

double modff(double x, double * y)
{
    *y=((int)x);
    return (x-*y);
}

double logf(const double x) _MATH_REENTRANT
{
    double Rz;
    double f, z, w, znum, zden, xn;
    int n;

    if (x<=0.0)
    {
        return 0.0;
    }
    f=frexpf(x, &n);
    znum=f-0.5;
    if (f>C0)
    {
        znum-=0.5;
        zden=(f*0.5)+0.5;
    }
    else
    {
        n--;
        zden=znum*0.5+0.5;
    }
    z=znum/zden;
    w=z*z;

    Rz=z+z*(w*A(w)/B(w));
    xn=n;
    return ((xn*C2+Rz)+xn*C1);
}

double log10f(const double x) _MATH_REENTRANT
{
    return logf(x)*0.4342944819;
}

double ldexpf(const double x, const int pw2)
{
    union double_long fl;
    long e;

    fl.f = x;

    e=(fl.l >> 23) & 0x000000ff;
    e+=pw2;
    fl.l= ((e & 0xff) << 23) | (fl.l & 0x807fffff);

    return(fl.f);
}

double frexpf(const double x, int *pw2)
{
    union double_long fl;
    long int i;

    fl.f=x;
    /* Find the exponent (power of 2) */
    i  = ( fl.l >> 23) & 0x000000ff;
    i -= 0x7e;
    *pw2 = i;
    fl.l &= 0x807fffff; /* strip all exponent bits */
    fl.l |= 0x3f000000; /* mantissa between 0.5 and 1 */
    return(fl.f);
}

double floorf (double x) _MATH_REENTRANT
{
    long r;
    r=x;
    if (r<=0)
        return (r+((r>x)?-1:0));
    else
        return r;
}

double fabsf(const double x) _MATH_REENTRANT
{
    union double_long fl;

    fl.f = x;
    fl.l &= 0x7fffffff;
    return fl.f;
}

double expf(const double x)
{
    int n;
    double xn, g, r, z, y;
    char sign;

    if(x>=0.0)
        { y=x;  sign=0; }
    else
        { y=-x; sign=1; }

    if(y<EXPEPS) return 1.0;

    if(y>BIGX)
    {
        if(sign)
        {
            return XMAX;
        }
        else
        {
            return 0.0;
        }
    }

    z=y*K1;
    n=z;

    if(n<0) --n;
    if(z-n>=0.5) ++n;
    xn=n;
    g=((y-xn*C1))-xn*C2;
    z=g*g;
    r=P(z)*g;
    r=0.5+(r/(Q(z)-r));

    n++;
    z=ldexpf(r, n);
    if(sign)
        return 1.0/z;
    else
        return z;
}

double cotf(const double x) _MATH_REENTRANT
{
    double y;

    y=fabsf(x);
    if (y<1.0E-30) //This one requires more thinking...
    {
        if (x<0.0)
            return -XMAX;
        else
            return XMAX;
    }
    return tancotf(x, 1);
}

double coshf(const double x) _MATH_REENTRANT
{
    return sincoshf(x, 1);
}

double cosf(double x) _MATH_REENTRANT
{
    if (x==0.0) return 1.0;
    return sincosf(x, 1);
}

double ceilf(double x) _MATH_REENTRANT
{
    long r;
    r=x;
    if (r<0)
        return r;
    else
        return (r+((r<x)?1:0));
}

double atanf(const double x) _MATH_REENTRANT
{
    double f, r, g;
    int n=0;
	static const double a[]={  0.0, 0.5235987756, 1.5707963268, 1.0471975512 };

    f=fabsf(x);
    if(f>1.0)
    {
        f=1.0/f;
        n=2;
    }
    if(f>K1)
    {
        f=((K2*f-1.0)+f)/(K3+f);
        // What it is actually wanted is this more accurate formula,
        // but SDCC optimizes it and then it does not work:
        // f=(((K2*f-0.5)-0.5)+f)/(K3+f);
        n++;
    }
    if(fabsf(f)<EPS) r=f;
    else
    {
        g=f*f;
        r=f+P(g,f)/Q(g);
    }
    if(n>1) r=-r;
    r+=a[n];
    if(x<0.0) r=-r;
    return r;
}

double atan2f(const double x, const double y)
{
    double r;

    if ((x==0.0) && (y==0.0))
    {
        return 0.0;
    }

    if(fabsf(y)>=fabsf(x))
    {
        r=atanf(x/y);
        if(y<0.0) r+=(x>=0?PI:-PI);
    }
    else
    {
        r=-atanf(y/x);
        r+=(x<0.0?-HALF_PI:HALF_PI);
    }
    return r;
}

double asinf(const double x) _MATH_REENTRANT
{   
         if(x== 1.0) return  HALF_PI;
    else if(x==-1.0) return -HALF_PI;
    else if(x== 0.0) return 0.0;
    else return asincosf(x,0);
}

double asincosf(const double x, const int isacos)
{
    double y, g, r;
    int i;

    static const double a[2]={ 0.0, QUART_PI };
    static const double b[2]={ HALF_PI, QUART_PI };

    y=fabsf(x);
    i=isacos;
    if (y < EPS) r=y;
    else
    {
        if (y > 0.5)
        {
            i=1-i;
            if (y > 1.0)
            {
                return 0.0;
            }
            g=(0.5-y)+0.5;
            g=ldexpf(g,-1);
            y=sqrtf(g);
            y=-(y+y);
        }
        else
        {
            g=y*y;
        }
        r=y+y*((P(g)*g)/Q(g));
    }
    if (isacos)
    {
        if (x < 0.0)
            r=(b[i]+r)+b[i];
        else
            r=(a[i]-r)+a[i];
    }
    else
    {
        r=(a[i]+r)+a[i];
        if (x<0.0) r=-r;
    }
    return r;
}

double acosf (const double x) _MATH_REENTRANT
{
  if (x == 1.0)
    return 0.0;
  else if (x == -1.0)
    return PI;
  else if (x == 0.0)
    return HALF_PI;
  return asincosf (x, 1);
}

#endif  /* _MATH_C */

