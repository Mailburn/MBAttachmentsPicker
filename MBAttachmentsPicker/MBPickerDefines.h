#define MBExecuteBlockSafely(block) ({ \
if (block) \
{ \
block(); \
} \
})