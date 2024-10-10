extends Node

# Player Stats
var money : int = 0
var time : int = 0
var day : int = 0
var satisfaction : int = 0

var money_earned : int = 0
var customers_served : int = 0

var holding_food = false
var locations = [[320.625, 1], [961.875, -1], [1299.375, 1], [1940.625, -1]]
# Day Stats
var day_length = [6, 24]
var outside_changes = [6, 10, 17, 21]

# Game Stats
var furniture_state = 0
var wall_state = 0
var kitchen_state = 0
var outside_state = 0

# Upgrade Stats
var furniture_cost = [100, 200, 350]
var wall_cost = [100, 150, 200]
var kitchen_cost = [200, 400, 600]

var furniture_effect = [10, 20, 40, 70]
var wall_effect = [10, 20, 40, 70]
var kitchen_effect = [10, 20, 40, 70]
