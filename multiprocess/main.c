#include <stdio.h>
#include <sys/socket.h>
#include <stdlib.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <string.h>

int create_socket() {
  int result = socket(AF_INET, SOCK_STREAM, 0);
  if(result == -1)
    exit(1);
  return result;
}

void bind_socket(int sock_fd) {
  struct sockaddr_in addr;

  addr.sin_family = AF_INET;
  addr.sin_addr.s_addr = inet_addr("0.0.0.0");
  addr.sin_port = htons(1515);

  if(bind(sock_fd, (struct sockaddr *) &addr, sizeof(addr)) == -1)
    exit(2);
}


int main(int argc, char** argv) {
  int sock_fd = create_socket();
  bind_socket(sock_fd);

  if(listen(sock_fd, 42) == -1)
    exit(3);

  struct sockaddr_in peer_address;
  socklen_t peer_address_len;

  while (1) {
    int client = accept(sock_fd, (struct sockaddr *) &peer_address, &peer_address_len);
    printf("pouet\n");

    if(client == -1)
      exit(4);

    if (fork() == 0) {
      dprintf(client, "c'est le process %d\n", getpid());
      sleep(20);
      close(client);
      exit(0);
    } else {
      close(client);
    }
  }

  printf("no pb\n");
  return 0;
}