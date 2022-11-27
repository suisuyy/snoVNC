TARGETS=websockify
CFLAGS += -fPIC -static-libgcc -static

all: $(TARGETS)

websockify: websockify.o websocket.o
	$(CC) $(LDFLAGS) $^ -lssl -lcrypto -o $@

websocket.o: websocket.c websocket.h
websockify.o: websockify.c websocket.h

clean:
	rm -f websockify *.o

