import json
def main():
    data = [
    {"time": 1394984189, "name": "cpu", "value": 12},
    {"time": 1394984190, "name": "cpu", "value": 19},
    ["time", "name", "value"],
    [1394984189, "cpu", 12],
    [1394984190, "cpu", 19]
    ]
    print(json.dumps(data, indent=4))
main()