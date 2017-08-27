#include "vpn_block.h"

#include "utils.h"

#define GREEN "0D8C2D"
#define YELLOW "F2CB05"
#define RED "AE030E"

using namespace std;

string get_vpn()
{
    string result = exec("expressvpn status");
    if(result.substr(0, 9) == "Connected")
        return print(" " + result.substr(13), GREEN, "vpn");
    if(result.substr(0, 4) == "Reco" || result.substr(0, 10) == "Connecting")
        return print("", YELLOW, "vpn");
    return print("", RED, "vpn");
}

void handle_vpn(int button)
{
    if(button != 2)
        return;
    string result = exec("expressvpn status");
    if(result.substr(0, 4) == "Reco" || result.substr(0, 10) == "Connecting")
        return;
    if(result.substr(0, 9) == "Connected")
        exec_background("expressvpn disconnect");
    else
        exec_background("expressvpn connect");
}
