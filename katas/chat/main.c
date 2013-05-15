#include <sys/types.h>
#include <sys/socket.h>

#include <arpa/inet.h>
#include <netinet/in.h>
#include <netinet/tcp.h>

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <errno.h>

#define MAX_CLIENTS 1024

int
main (int argc, const char ** argv)
{
  int                   server_sock;
  int                   client_sock;
  uint8_t               client_socks[MAX_CLIENTS];
  struct sockaddr_in    localaddr;

  int                   result;

  char                  buffer[4096];
  char                  output[4096];
  int                   output_size;

  fd_set                read_set;
  int                   fd;

  int                   nb_read;

  memset (client_socks, 0, sizeof (client_socks));

  server_sock = socket (AF_INET, SOCK_STREAM, 0);
  if (server_sock == -1) {
    perror ("socket");
    return (1);
  }

  setsockopt (server_sock, SOL_SOCKET, SO_REUSEADDR, NULL, 0);

  localaddr.sin_family = AF_INET;
  localaddr.sin_addr.s_addr = htonl (INADDR_ANY);
  localaddr.sin_port = htons (4807);

  result = bind (server_sock, (struct sockaddr *)&localaddr, sizeof (localaddr));
  if (result == -1) {
    perror ("bind");
    return (1);
  }

  if (listen (server_sock, 1024) == -1) {
    perror ("listen");
    return (1);
  }

  for (;;) {
    for (fd = 0; fd < MAX_CLIENTS; fd++) {
      FD_CLR (fd, &read_set);
      if (client_socks[fd]) {
        FD_SET (fd, &read_set);
      }
    }
    FD_SET (server_sock, &read_set);

    select (1024, &read_set, NULL, NULL, NULL);

    for (fd = 0; fd < MAX_CLIENTS; fd++) {
      if (FD_ISSET (fd, &read_set)) {
        if (fd == server_sock) {
          client_sock = accept (server_sock, NULL, NULL);
          if (client_sock == -1) {
            perror ("listen");
          }
          client_socks[client_sock] = 1;
        } else {
          nb_read = read (fd, buffer, sizeof (buffer) - 1);
          if (nb_read == 0) {
            close (fd);
            client_socks[fd] = 0;
          } else {
            for (client_sock = 0; client_sock < MAX_CLIENTS; client_sock++) {
              if (client_socks[client_sock] && client_sock != fd) {
                buffer[nb_read] = '\0';
                output_size = snprintf (output, sizeof (output), "[%d] %s", fd, buffer);
                write (client_sock, output, output_size);
              }
            }
          }
        }
      }
    }
  }
}
