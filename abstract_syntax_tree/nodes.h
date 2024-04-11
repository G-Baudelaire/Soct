//
// Created by Germain Jones on 04/04/2024.
//

#ifndef SOCT_NODES_H
#define SOCT_NODES_H

#endif //SOCT_NODES_H

#include <iostream>
#include <cstdlib>
#include <string>
#include <map>
#include <list>

using namespace std;

class Channel {
protected:
    string channel_id;
public:
    Channel(string value);
};

class SoloObjects {
protected:
    list<Channel *> *channels;
public:
    explicit SoloObjects(list<Channel *> *channels);
};

class Agent {
};

class Inaction : public Agent {
};

class Solo : public Agent {
public:
    Channel *channel;
    SoloObjects *data;

    Solo(Channel *left, SoloObjects *right);
};

class Send : public Solo {
public:
    Send(Channel *left, SoloObjects *right);
};

class Receive : public Solo {
public:
    Receive(Channel *left, SoloObjects *right);
};

class ReplicatedReceive : public Solo {
public:
    ReplicatedReceive(Channel *left, SoloObjects *right);
};

class Composition : public Agent {
protected:
    Agent *left_agent, *right_agent;
public:
    Composition(Agent *l_agent, Agent *r_agent);
};

class Bind : public Agent {
protected:
    list<Channel *> *channels;
    Agent *agent;
public:
    Bind(list<Channel *> *channel_list, Agent *ag);
};

class Match : public Agent {
protected:
    list<Channel *> *channels_1;
    list<Channel *> *channels_2;
    Agent *agent;
public:
    Match(list<Channel *> *c1, list<Channel *> *c2, Agent *ag);
};

class Program {
protected:
    list<Agent *> *agents;
public:
    explicit Program(list<Agent *> *agent_list);
};

// the object at the base of our tree
extern map<string, float> idTable;
extern Program *root;