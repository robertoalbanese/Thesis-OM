#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <errno.h>
#include <string.h>

// Need to link with Ws2_32.lib, Mswsock.lib, and Advapi32.lib
#ifdef _WIN32
#include <WinSock2.h>
#include <Ws2tcpip.h>
#include <windows.h>
#pragma comment(lib, "Ws2_32.lib")
#else
// Do something else here for non windows
#endif

#define SERVER "127.0.0.1" // or "localhost" - ip address of UDP server
#define DEFAULT_BUFLEN 512
#define DEFAULT_PORT 8888

double kappa = 0;

// typedef struct {
//   struct sockaddr_un* address;
//   int id;
// } SocketConnection;

typedef struct
{
  struct sockaddr_in *address;
  SOCKET id;
} SocketConnection;

void *initSocketConnection()
{

  WSADATA wsaData;
  // printf("Before WSAStartup\n");
  int res = WSAStartup(MAKEWORD(2, 2), &wsaData);
  if (res != NO_ERROR)
  {
    printf("WSAStartup failed with error %d\n", res);
    exit(0);
  }

  SocketConnection *con = malloc(sizeof(SocketConnection));
  con->address = malloc(sizeof(struct sockaddr_in));
  int len;

  if ((con->id = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) == SOCKET_ERROR)
  {
    printf("socket failed with error %d\n", WSAGetLastError());
    exit(0);
  }

  con->address->sin_family = AF_INET;
  con->address->sin_port = htons(DEFAULT_PORT);
  con->address->sin_addr.s_addr = inet_addr(SERVER);

  char SendBuf[DEFAULT_BUFLEN] = "start";
  int BufLen = (int)(sizeof(SendBuf) - 1);
  int clientAddrSize = (int)sizeof(*con->address);

  int clientResult = sendto(con->id, SendBuf, BufLen, 0, (SOCKADDR *)con->address, clientAddrSize);

  if (clientResult == -1)
  {
    printf("Error sending\n");
  }

  return (void *)con;
}

void closeSocketConnection(void *object)
{
  SocketConnection *con = (SocketConnection *)object;
  char SendBuf[DEFAULT_BUFLEN] = "stop";
  int BufLen = (int)(sizeof(SendBuf) - 1);
  int clientAddrSize = (int)sizeof(*con->address);

  int clientResult = sendto(con->id, SendBuf, BufLen, 0, (SOCKADDR *)con->address, clientAddrSize);

  if (clientResult == -1)
  {
    printf("Error sending\n");
  }
  closesocket(con->id);
  free(con->address);
  free(con);
  WSACleanup();
};

double getJointPositions(void *object, float a)
{
  SocketConnection *con = (SocketConnection *)object;
  // int clientAddrSize = (int)sizeof(*con->address);
  int slen = sizeof(struct sockaddr_in);

  char message[DEFAULT_BUFLEN];
  // char SendBuf[DEFAULT_BUFLEN];
  int BufLen = (int)(sizeof(message) - 1);
  // gcvt(a, 4, SendBuf);
  // const char *toSend = "foobar";
  // strcpy(SendBuf, toSend);
  // int clientResult = sendto(con->id,SendBuf, BufLen, 0, (SOCKADDR *)con->address, clientAddrSize);
  // if (clientResult == -1)
  // {
  //   printf("Error sending\n");
  // }

  int message_len;
  if (message_len = recvfrom(con->id, message, BufLen, 0, (SOCKADDR *)con->address, &slen) == SOCKET_ERROR)
  {
    printf("recvfrom() failed with error code: %d", WSAGetLastError());
    exit(0);
  }
  int output = atoi(message);

  return (double)output;
}
