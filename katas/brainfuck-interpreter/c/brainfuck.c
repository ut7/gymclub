#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MEMLEN 0xFFFF

int
main (int argc, const char ** argv)
{
  char *ip;

  char memory[MEMLEN];
  char *dp;
  unsigned int c;
  int i;

  if (argc < 2 || strlen (argv[1]) >= MEMLEN) return (1);

  dp = (char *)memset(memory, '\0', sizeof (memory));
  char * lol = dp;
  for (ip = (char *)argv[1], i=0; *ip; ++ip, ++i) {
    switch (*ip) {
    case '.': printf("%c", *dp);        break ;
    case '<': --dp;                     break ; 
    case '>': ++dp;                     break ;
    case '+': (*dp)++;                  break ;
    case '-': (*dp)--;                  break ;
    case ',': (*dp) = getchar();        break ;
    case '[':
      if (!*dp)
        for (c = 1, ++ip; *ip != ']' && c; ++ip)
          *ip == '[' ? ++c : *ip == ']' ? --c : c;
      break ;
    case ']':
      if (*dp)
        for (c = 1, --ip; *ip != '[' && c; --ip)
          *ip == '[' ? ++c : *ip == ']' ? --c : c;
      break ;
    }
  }
}
