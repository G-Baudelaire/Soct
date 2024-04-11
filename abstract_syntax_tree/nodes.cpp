//
// Created by Germain Jones on 04/04/2024.
// Based on https://web.eecs.utk.edu/~bvanderz/cs461/notes/parse_tree/
//

#include <string>
#include <map>
#include <list>
#include "nodes.h"

using namespace std;

Channel::Channel(string value) : channel_id(value) {}

SoloObjects::SoloObjects(list<Channel *> *channel_list) :
        channels(channel_list) {}

Solo::Solo(Channel *left, SoloObjects *right) :
        channel(left), data(right) {}

Send::Send(Channel *left, SoloObjects *right) : Solo(left, right) {}

Receive::Receive(Channel *left, SoloObjects *right) : Solo(left, right) {}

ReplicatedReceive::ReplicatedReceive(Channel *left, SoloObjects *right) :
        Solo(left, right) {}

Composition::Composition(Agent *l_agent, Agent *r_agent) :
        left_agent(l_agent), right_agent(r_agent) {}

Bind::Bind(list<Channel *> *channel_list, Agent *ag) :
        channels(channel_list), agent(ag) {}

Match::Match(list<Channel *> *c1, list<Channel *> *c2, Agent *ag) :
        channels_1(c1), channels_2(c2), agent(ag) {}

Program::Program(list<Agent *> *agent_list) :
        agents(agent_list) {}

map<string, float> idTable;
