import math


class Order:
    def __init__(self, idd, address, x, y, delivery_amount, pickup_amount, distancee=None,
                 distance_to_stores=None, prob_return = 0, is_return=False):
        self.idd = idd
        self.address = address
        self.x = x
        self.y = y
        self.delivery_amount = 0 if math.isnan(delivery_amount) else delivery_amount
        self.pickup_amount = 0 if math.isnan(pickup_amount) else pickup_amount

        # Distance from order or depot to all remaining orders
        if distancee is None:
            distancee = []
        self.distancee = distancee

        # Distance from order or depot to all remaining orders
        if distance_to_stores is None:
            distance_to_stores = []
        self.distance_to_stores = distance_to_stores

        self.prob_return = prob_return
        self.is_return = is_return

    def __repr__(self):
        return str(self.__dict__)
