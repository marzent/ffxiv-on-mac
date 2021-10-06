//
//  main.c
//  fixbpf
//
//  Created by Marc-Aurel on 06.10.21.
//


#include <stdlib.h>
#include <unistd.h>
#include "pcap.h"
#define MAX_DEV 100

void open_close_alldevs(void);

int main()
{
    open_close_alldevs(); //create some bpf devices
    system("/usr/sbin/chown root:admin /dev/bpf*");
    system("/bin/chmod g+r /dev/bpf*");
    sleep(10);
    open_close_alldevs(); //running a 2nd time creates even more bpf devices
    system("/usr/sbin/chown root:admin /dev/bpf*");
    system("/bin/chmod g+r /dev/bpf*");
    return 0;
}

void open_close_alldevs(void) {
    pcap_if_t *alldevs, *d;
    pcap_t *adhandle[MAX_DEV];
    char errbuf[PCAP_ERRBUF_SIZE];
    int i = 0;
    
    if(pcap_findalldevs(&alldevs, errbuf) == -1)
    {
        fprintf(stderr,"Error in pcap_findalldevs: %s\n", errbuf);
        exit(1);
    }
    
    for(d=alldevs; d; d=d->next)
    {
        if ((adhandle[i]= pcap_open_live(d->name,65536,0,1000,errbuf)) == NULL)
        {
            fprintf(stderr,"\nUnable to open the adapter %s.\n", alldevs->name);
            i++;
            exit(-1);
        }
        i++;
    }
    i=0;
    for(d=alldevs; d; d=d->next)
        if (adhandle[i])
            pcap_close(adhandle[i++]);
    pcap_freealldevs(alldevs);
}
