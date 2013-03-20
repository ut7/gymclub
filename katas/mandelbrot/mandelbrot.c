#include <stdio.h>
#include <stdlib.h>
#include <complex.h>

#define MAX_ITERATION 100.0

int
in_square(float    x,
          float    y)
{
  return (x > -0.5 && x < 0.5 && y < 0.5 && y > -0.5);
}

int
in_circle(float    x,
          float    y)
{
  double complex c = x + y * I;

  return (cabsf (c) < 0.5);
}

int
in_mandelbrot_set(float x,
                  float y)
{
  double complex c = x + y * I;
  double complex z = 0;

  for (unsigned int i = 0; i < MAX_ITERATION; i++) {
    z = (z * z) + c;

    if (cabsf (z) > 2) {
      return (i);
    }
  }

  return (MAX_ITERATION);
}

void
render(float    x,
       float    y)
{
  int color;

  color = in_mandelbrot_set(x, y) % 8;
  if (color == 0) {
    printf(".");
  } else {
    printf("\x1b[3%dm0\x1b[0m", color);
  }
}

int
main(int                argc,
     const char **      argv)
{
  unsigned int          screen_x;
  unsigned int          screen_y;

  unsigned int          x;
  unsigned int          y;

  float                 xmap;
  float                 ymap;

  float                 xmap_min = -2;
  float                 xmap_max = +1;

  float                 ymap_min = -1;
  float                 ymap_max = +1;

  if (argc < 3) {
    return (1);
  }

  screen_x = atoi (argv[1]);
  screen_y = atoi (argv[2]);

  if (argc >= 7) {
    xmap_min = atof (argv[3]);
    xmap_max = atof (argv[4]);
    ymap_min = atof (argv[5]);
    ymap_max = atof (argv[6]);
  }

  for (y = 0; y < screen_y; y++) {
    ymap = (y / (float)screen_y * (ymap_max - ymap_min)) + ymap_min;

    for (x = 0; x < screen_x; x++) {
      xmap = (x / (float)screen_x * (xmap_max - xmap_min)) + xmap_min;

      render(xmap, ymap);
    }
    printf("\n");
  }
}
