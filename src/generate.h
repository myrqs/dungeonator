#ifndef GENERATE_H
#define GENERATE_H

#include "grid.h"
#include "rooms.h"
#include "maze.h"
#include "connectors.h"

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

  bool generateDungeon(int width, int height, int placeTries, int additionalRoomSize, Grid* grid);

#ifdef __cplusplus
}
#endif // __cplusplus

#endif // !GENERATE_H

