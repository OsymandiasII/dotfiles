#ifndef COMMON_BLOCKS_H_
#define COMMON_BLOCKS_H_

#include <string>

#include <math.h>

std::string get_battery();
std::string get_dns();
std::string get_light();
std::string get_sound();
std::string get_temperature();
std::string get_time();
std::string get_wifi();

void handle_sound(int button);

#endif /* COMMON_BLOCKS_H_ */
