from thesis.order import Order
from thesis.vehicle import Vehicle
from geopy.x
import time
import pandas as pd
import copy
import random

f_iter = 100
popSize = 200
numVehicle = 30
costEachStop = 5000
holdingCost = 3000
maxDistance = 9999999
numberLoopPart2 = 2

depot = None
orders = None
stores = None
geolocator = Nominatim()

def main():
    n = popSize
    get_data()
    c1 = 1
    i = 1
    tabu_list = []
    x = gen_random_solution(orders)
    if len(x) == 0:
        print("Can't find solution")
        return
    tabu_list.append(repr(x))
    xb = x
    age = 0
    f = 0
    a1 = fz(xb) / fz(x)
    a2 = c1 / i
    t = 1 + a1 * a2
    while f < f_iter:
        print("f = " + str(f))
        while True:
            x_temp = gen_random_solution(orders)
            if len(x_temp) == 0:
                print("Can't find solution")
                return xb
            list_solution = list()
            list_solution.extend(gen_solution_a_b(x_temp))
            list_solution.extend(gen_solution_c(x_temp))
            list_solution.extend(gen_solution_d(x_temp))
            distance_travel = maxDistance
            for soluton in list_solution:
                if get_distance_travel(soluton) < distance_travel and repr(x_temp) not in tabu_list:
                    distance_travel = get_distance_travel(soluton)
                    x_temp = soluton
            if distance_travel < maxDistance:
                break
        if fz(x_temp) <= t * fz(xb):
            x = x_temp
            i += 1
            age = 0
            tabu_list.append(repr(x))
            if fz(x) < fz(xb):
                f = 0
                xb = x
                c1 += 1
            else:
                f += 1
            a1 = fz(xb) / fz(x)
            a2 = c1 / i
            t = 1 + a1 * a2
        else:
            age += 1
            if age == n:
                age = 0
                t += a1 * a2
    return xb

# --------- Get data ----------
def get_data():
    get_data_depot_from_excel()
    get_data_order_from_excel()
    get_data_store_from_excel()
    get_distance_depot_to_orders()
    get_distance_between_orders()

def get_data_depot_from_excel():
    global depot
    df = pd.read_excel('test.xlsx', sheet_name='Depot')
    depot = Order(0, df['Address'][0], df['x'][0], df['y'][0], 0, 0)

def get_data_order_from_excel():
    global orders
    df_order = pd.read_excel('test.xlsx', sheet_name='Order')
    orders = []
    number_of_row = df_order.count()[0]
    for i in range(number_of_row):
        o = df_order.loc[i, :]
        obj = Order(o['Order'], o['Address'], o['x'], o['y'], o['Delivery'], o['Pickup'])
        obj.prob_return = random.random()
        orders.append(obj)

def get_data_store_from_excel():
    global stores
    df_order = pd.read_excel('test.xlsx', sheet_name='Store')
    stores = []
    number_of_row = df_order.count()[0]
    for i in range(number_of_row):
        o = df_order.loc[i, :]
        obj = Order(i, o['Address'], o['x'], o['y'], 0, 0)
        stores.append(obj)

def get_distance_depot_to_orders():
    depot.distancee.append(0)
    for o in orders:
        depot.distancee.append(get_distance_between_two_point(depot, o))

def get_distance_between_orders():
    for i in orders:
        i.distancee.append(get_distance_between_two_point(i, depot))
        for j in orders:
            d = 0 if i.idd == j.idd else get_distance_between_two_point(i, j)
            i.distancee.append(d)

def get_distance_between_stores():
    for i in stores:
        for j in orders:
            i.distancee.append(get_distance_between_two_point(i, j))
def get_distance_between_two_point(o1, o2):
    p1 = (o1.x, o1.y)
    p2 = (o2.x, o2.y)
    return distance.distance(p1, p2).km

def get_distance_travel(solution):
    d = 0
    current_point = depot
    for vehicle in solution:
        for o in vehicle.orders:
            d += get_distance_between_two_point(current_point, o)
            current_point = o
        if len(vehicle.orders) != 0:
            d += get_distance_between_two_point(vehicle.orders[-1], depot)
    return d

# --------- Gen data ----------
def gen_random_solution(list_order):
    print("gen_random_solution")
    p = 0
    while True:
        # Return false if can't get solution after 50
        p += 1
        if p > 50:
            return []
        vehicles = []
        for i in range(numVehicle):
            vehicles.append(Vehicle())
        random.shuffle(list_order)
        i = 0
        k = 0
        for o in list_order:
            k = 0
            while k < numVehicle:
                v = vehicles[i]
                a = v.amount + o.pickup_amount + o.delivery_amount
                if a <= v.capacity:
                    v.amount = a
                    v.orders.append(o)
                    i = i + 1 if i + 1 < numVehicle else 0
                    break
                else:  
                    i = i + 1 if i + 1 < numVehicle else 0
                    k += 1
            if k == numVehicle:
                break
        if k != numVehicle:
            break
    return vehicles

def gen_random_solution_2(list_order):
    print("gen_random_solution_for_return_order")
    vehicles = [Vehicle()]
    random.shuffle(list_order)
    i = 0
    for o in list_order:
        v = vehicles[i]
        a = v.amount + o.pickup_amount + o.delivery_amount
        if a <= v.capacity:
            v.amount = a
            v.orders.append(o)
        else:  
            i = i + 1
            v = Vehicle()
            v.amount = o.pickup_amount + o.delivery_amount
            v.orders.append(o)
            vehicles.append(v)
    return vehicles

def gen_solution_a_b(vehicles):
    print("gen_solution_a_b")
    list_solution = []
    best_solution = []
    n = popSize / len(vehicles)
    for i in range(len(vehicles)):
        distance_travel = maxDistance
        temp_solution = vehicles
        count = 0
        ln = len(vehicles[i].orders)
        for j in range(ln):
            for k in range(ln):
                if j == k:
                    continue
                v_copy = copy.deepcopy(vehicles)
                v_copy[i].orders[j], v_copy[i].orders[k] = v_copy[i].orders[k], v_copy[i].orders[j]
                v_distance_travel = get_distance_travel(v_copy)
                if v_distance_travel < distance_travel:
                    temp_solution = v_copy
                    distance_travel = v_distance_travel
                count += 1
                if count > n:
                    break
            if count > n:
                break
        best_solution.append(temp_solution[i])
    list_solution.append(best_solution)
    return list_solution

def gen_solution_c(vehicles):
    print("gen_solution_c")
    list_solution = []
    best_solution = []
    n = popSize / len(vehicles)
    for i in range(len(vehicles)):
        distance_travel = maxDistance
        temp_solution = vehicles
        count = 0
        ln = len(vehicles[i].orders)
        for j in range(ln):
            for k in range(ln):
                if (j > k - 2) and (j < k + 2):
                    continue
                v_copy = copy.deepcopy(vehicles)
                v_copy[i].orders.insert(k, v_copy[i].orders.pop(j))
                v_distance_travel = get_distance_travel(v_copy)
                if v_distance_travel < distance_travel:
                    temp_solution = v_copy
                    distance_travel = v_distance_travel
                count += 1
                if count > n:
                    break
            if count > n:
                break
        best_solution.append(temp_solution[i])
    list_solution.append(best_solution)
    return list_solution

def gen_solution_d(vehicles):
    print("gen_solution_d")
    list_solution = []
    best_solution = []
    n = popSize / len(vehicles)
    for i in range(len(vehicles)):
        distance_travel = maxDistance
        temp_solution = vehicles
        count = 0
        ln = len(vehicles[i].orders)
        for j in range(ln):
            for k in range(ln):
                if (j > k - 3) and (j < k + 3):
                    continue
                v_copy = copy.deepcopy(vehicles)
                v_copy[i].orders[j:(k + 1)] = reversed(v_copy[i].orders[j:(k + 1)])
                v_distance_travel = get_distance_travel(v_copy)
                if v_distance_travel < distance_travel:
                    temp_solution = v_copy
                    distance_travel = v_distance_travel
                count += 1
                if count > n:
                    break
            if count > n:
                break
        best_solution.append(temp_solution[i])
    list_solution.append(best_solution)
    return list_solution

def fz(vehicles):
    z = 0
    current_point = depot
    for vehicle in vehicles:
        z += vehicle.fixedCost
        for o in vehicle.orders:
            z += costEachStop * get_distance_between_two_point(current_point, o)
            current_point = o
        if len(vehicle.orders) != 0:
            z += costEachStop * get_distance_between_two_point(vehicle.orders[-1], depot)
    return z

def fz2(po_num, orders):
    z = 0
    current_point = depot
    for o in orders:
        z += costEachStop * get_distance_between_two_point(current_point, o)
        current_point = o
        if (po_num == 1 or po_num == 3) and o.delivery_amount == 0 and o.pickup_amount == 0:
            z += holdingCost
    if len(orders) != 0:
        z += costEachStop * get_distance_between_two_point(orders[-1], depot)
    return z

#Python code for game model
# Part 2
u1 = [[1, 1], [1, 1]]
u2 = [[1, 1], [1, 1]]

def part2(b_):
    v_count = 0
    for vehicle in b_solution:
        v_count += 1
        for o in reversed(vehicle.orders):
            if o.is_return:
                i_b = 0
                j_b = 0
                ub = u1[0][0]
                u2_z = [[get_new_route(1, vehicle), get_new_route(2, vehicle)],
                        [get_new_route(3, vehicle), get_new_route(4, vehicle)]]
                print("----------------------------------")
                for i in range(2):
                    for j in range(2):
                        po_num = 2 * i + j + 1
                        u2[i][j] = u2[i][j] * fz2(po_num, u2_z[i][j])
                        print("PO " + str(po_num) + " - " + str(u2[i][j]))
                print("----------------------------------")
                is_find_ij = False
                is_find_best = False
                for i in range(2):
                    if not is_find_best:
                        for j in range(2):
                            if not is_find_ij:
                                # 3.1
                                if ub <= u1[i][j]:
                                    ub = u1[i][j]
                                    w = 1 if j == 0 else 0
                                    if u2[i][j] <= u2[i][w]:
                                        ub = u2[0][0]
                                        i_b = i
                                        j_b = j
                                        is_find_ij = True
                            if is_find_ij:
                                if ub <= u2[i][j]:
                                    ub = u2[i][j]
                                    r = 1 if i == 0 else 0
                                    if u1[i][j] <= u1[r][j]:
                                        print("Original route: ")
                                        k = 0
                                        for v in vehicle.orders:
                                            is_return_s = "(return)" if v.is_return else ""
                                            k += 1
                                            if k == len(vehicle.orders):
                                                print(str(v.idd) + is_return_s)
                                            else:
                                                print(str(v.idd) + is_return_s, end=" -> ")
                                        is_find_best = True
                                        print("(i, j) = (" + str(i_b) + ", " + str(j_b) +
                                              ") | (u1, u2) = (" + str(u1[i][j]) + ", " + str(u2[i][j]) + ")")
                                        po_num = 2 * i + j + 1
                                        print("PO - " + str(po_num))
                                        print("Vehicle " + str(v_count))
                                        k = 0
                                        for v in u2_z[i][j]:
                                            k += 1
                                            if k == len(u2_z[i][j]):
                                              print(print_id_route_part_2(po_num, v))
                                            else:
                                              print(print_id_route_part_2(po_num, v), end=" -> ")
                                        print("Total cost:" + str(fz(b_solution) + fz2(po_num, u2_z[i][j]) - fz2(po_num, vehicle.orders)))
                                        v1 = Vehicle()
                                        v1.orders = u2_z[i][j]
                                        v2 = Vehicle()
                                        v2.orders = vehicle.orders
                                        print("Total distance:" + str(get_distance_travel(b_solution) + get_distance_travel([v1]) - get_distance_travel([v2])))
                                        break
                    else:
                        break
                break

def print_id_route_part_2(po, v):
    if v.delivery_amount != 0 or v.pickup_amount != 0:
        return str(v.idd)
    if po == 1 or po == 3:
        return str(v.idd) + "(store)"
    if po == 2 or po == 4:
        return str(v.idd) + "(depot)"

def get_new_route(po, route):
    route = route.orders
    new_route = []
    if po == 1:
        for order in route:
            if order.is_return:
                new_route.append(get_store_near_address(order))
            else:
                new_route.append(order)
    elif po == 2:
        return_orders = []
        for order in route:
            if order.is_return:
                return_orders.append(order)
            else:
                new_route.append(order)
        new_route.append(depot)
        for o in return_orders:
            new_route.append(o)
    elif po == 3:
        for order in route:
            if order.is_return:
                new_route.append(order)
                new_route.append(get_store_near_address(order))
            else:
                new_route.append(order)
    elif po == 4:
        return_orders = []
        for order in route:
            new_route.append(order)
            if order.is_return:
                return_orders.append(order)
        new_route.append(depot)
        for o in return_orders:
            new_route.append(o)
    return new_route

def get_store_near_address(order):
    i = 0
    min_index = 0
    min_distance = 0
    for store in stores:
        i += 1
        p1 = (store.x, store.y)
        p2 = (order.x, order.y)
        d = distance.distance(p1, p2).km
        if min_distance < d:
            min_distance = d
            min_index = i
    return stores[min_index]

def print_result(vehicles):
    xb_update = []
    return_orders = []
    for vehicle in vehicles:
        return_orders += list(filter(lambda ro: ro.is_return, vehicle.orders))
        temp_vehicle = Vehicle()
        temp_vehicle.orders = list(filter(lambda ro: not ro.is_return, vehicle.orders))
        xb_update.append(temp_vehicle)
    route_2 = gen_random_solution_2(return_orders)
    xb_update += route_2

    print("Route 1")
    i = 1
    for vehicle in vehicles:
        print("Vehicle " + str(i) + ": ")
        j = 0
        for o in vehicle.orders:
            is_return_s = "(return)" if o.is_return else ""
            j += 1
            if j == len(vehicle.orders):
                print(str(o.idd) + is_return_s)
            else:
                print(str(o.idd) + is_return_s, end=" -> ")
        i += 1

    print("Route 2 (return orders route 1): ")
    i = 1
    for vehicle in route_2:
        print("Vehicle " + str(i) + ": ")
        j = 0
        for o in vehicle.orders:
            j += 1
            if j == len(vehicle.orders):
                print(str(o.idd))
            else:
                print(str(o.idd), end=" -> ")
        i += 1
    print("Total cost: " + str(fz(xb_update)))
    print("Distance travel: " + str(get_distance_travel(xb_update)) + " km")

    for i in range(numberLoopPart2):
        # Gen random cancel_number
        cancel_number = random.randint(1, len(orders))
        # Sort order by prob_return - from max -> min
        sort_orders = copy.deepcopy(orders).sort(key=lambda o: o.prob_return, reverse=True)
        # Get id of n order cancel
        sort_orders = list(map(lambda o: o.idd, sort_orders[:cancel_number]))
        # Set return for order in vehicles
        for vehicle in vehicles:
            for o in vehicle.orders:
                is_return = o.idd in sort_orders
        # Run part 2
        part2(vehicles)

def print_obj(clas, indent=0):
    print(' ' * indent + type(clas).__name__ + ':')
    indent += 4
    for k, v in clas.__dict__.items():
        if '__dict__' in dir(v):
            print_obj(v, indent)
        else:
            print(' ' * indent + k + ': ' + str(v))
# Only for debug
st = time.time()
b_solution = main()
print_result(b_solution)
print("----%.2f----" % (time.time() - st))
