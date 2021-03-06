#include "common_blocks.h"

#include "colors.h"
#include "utils.h"

using namespace std;

string get_battery()
{
    string result = exec("acpi");
    bool charging = result.find("Charging") != -1 || result.find("Full") != -1;
    int percent = stoi(result.substr(result.find(",") + 2, result.size() - 1));
    if(charging || percent == 100)
        return print(" " + to_string(percent) + "%", GREEN, "battery");
    if(percent >= 75)
        return print(" " + to_string(percent) + "%", GREEN, "battery");
    if(percent >= 50)
        return print(" " + to_string(percent) + "%", YELLOW, "battery");
    if(percent >= 25)
        return print(" " + to_string(percent) + "%", ORANGE, "battery");
    if(percent >= 12)
        return print(" " + to_string(percent) + "%", DARK_ORANGE, "battery");
    return print(" " + to_string(percent) + "%", RED, "battery");
}

string get_dns()
{
    string grep = " | grep -oP '(?<=inet\\s)\\d+(\\.\\d+){3}'";
    if(exec("ip addr show wlp3s0" + grep).size() != 0)
//            || exec("ip addr show eno1" + grep).size() !=  0)
        return print("", GREEN, "dns");
    return print("", RED, "dns");
}

string get_light()
{
    int percent = ceil(stof(exec("xbacklight -get")));
    return print(" " + to_string(percent) + "%", GREEN, "light");
}

string get_sound()
{
    if(exec("pamixer --get-mute") == "true")
        return print(" muted", RED, "sound");
    return print(" " + exec("pamixer --get-volume") + "%", GREEN, "sound");
}

string get_temperature()
{
    string result = exec("sensors -A dell_smm-virtual-0");
    int pos = result.find("CPU:") + 4;
    int t = stoi(result.substr(pos, result.find("C", pos) - pos - 1));
    if(t <= 50)
        return print(" " + to_string(t) + "°C", GREEN, "temperature");
    if(t <= 75)
        return print(" " + to_string(t) + "°C", YELLOW, "temperature");
    if(t <= 82)
        return print(" " + to_string(t) + "°C", ORANGE, "temperature");
    if(t <= 90)
        return print(" " + to_string(t) + "°C", DARK_ORANGE, "temperature");
    return print(" " + to_string(t) + "°C", RED, "temperature");
}

string get_time()
{
    return print(exec("date +\"%H:%M\""), "000000", "time");
}

string get_wifi()
{
    string result = exec("iw dev wlp3s0 link");
    bool connected = result != "Not connected.";
    if(!connected)
        return print("", RED, "wifi");
    int pos = result.find("signal: ") + 8;
    int percent = (stoi(result.substr(pos, result.find(" dBm"))) + 100) * 2;
    if(percent > 100)
        percent = 100;
    if(percent >= 75)
        return print(" " + to_string(percent) + "%", GREEN, "wifi");
    if(percent >= 50)
        return print(" " + to_string(percent) + "%", YELLOW, "wifi");
    if(percent >= 25)
        return print(" " + to_string(percent) + "%", ORANGE, "wifi");
    return print(" " + to_string(percent) + "%", DARK_ORANGE, "wifi");
}

string get_night()
{
    int percent = ceil(stof(exec("xbacklight -get")));
    if(percent < 10)
        return print("", GREEN, "night");
    return print("", RED, "night");
}

void handle_sound(int button)
{
    if(button == 2)
        exec_background("pamixer -t");
    else
        exec_background("pavucontrol");
}

void handle_night(int button)
{
    int percent = ceil(stof(exec("xbacklight -get")));
    if(percent <= 10)
        exec_background("xbacklight -set 100");
    else
        exec_background("xbacklight -set 1");
}
