#ifndef AsConfig_h
#define AsConfig_h


#define PRINT_LOG   0

#if DEBUG && PRINT_LOG
#    define DLog(...) NSLog(__VA_ARGS__)
#else
#    define DLog(...)
#endif

#endif
