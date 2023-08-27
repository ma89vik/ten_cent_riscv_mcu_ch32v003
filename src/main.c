
#define PROJECT_NAME "ten_cent_riscv_mcu_ch32v003"

static volatile int test = 4;

int main() {
    test = test + 4;
    return 0;
}
