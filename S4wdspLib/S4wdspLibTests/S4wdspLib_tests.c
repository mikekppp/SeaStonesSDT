//
//  wdsp_tests.c
//  S4wdspTests
//
//  Created by Michael Papp on 8/29/25.
//

#include "S4wdspLib_tests.h"

#include <pthread.h>
#include <unistd.h>


static pthread_t wisdom_thread_id;
static int wisdom_running = 0;


static void* wisdom_thread(void *arg)
{
	if (WDSPwisdom ((char *)arg)) {
		printf("%s: WDSP wisdom file has been rebuilt.\n", __FUNCTION__);
	}
	else
	{
		printf("%s: Re-using existing WDSP wisdom file.\n", __FUNCTION__);
	}
	wisdom_running = 0;
	return NULL;
}


int test_wisdom_generation(void)
{
	char wisdomDirBuf[1025];
	char cwdBuf[1024];

	// Let WDSP (via FFTW) check for wisdom file in current dir
	// If there is one, the "wisdom thread" takes no time
	// Depending on the WDSP version, the file is wdspWisdom or wdspWisdom00.

	(void)getcwd(cwdBuf, sizeof(cwdBuf));
	snprintf(wisdomDirBuf, sizeof(wisdomDirBuf), "%s/", cwdBuf);
	printf("%s: Securing wisdom file in directory: %s\n", __FUNCTION__, wisdomDirBuf);

	wisdom_running = 1;
	pthread_create(&wisdom_thread_id, NULL, wisdom_thread, wisdomDirBuf);

	while (wisdom_running)
	{
		// wait for the wisdom thread to complete
		usleep(100000); // 100ms
	}
	return 0;
}
