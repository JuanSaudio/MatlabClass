function fax = smaartFrequencies
    fax = [10.742188, 11.718750, 12.695312, 13.671875, 14.648438, 15.625000, 16.601562, 17.578125, 18.554688, 19.531250, 20.507812, 21.484375, 22.460938, 23.437500, 24.414062, 25.390625, 26.367188, 27.343750, 28.320312, 29.296875, 30.273438, 31.250000, 32.226562, 33.203125, 34.179688, 35.156250, 36.132812, 37.109375, 38.085938, 39.062500, 40.039062, 41.015625, 41.992188, 42.968750, 43.945312, 44.921875, 45.898438, 46.875000, 47.851562, 48.828125, 49.804688, 50.781250, 51.757812, 52.734375, 53.710938, 54.687500, 55.664062, 56.640625, 57.617188, 58.593750, 59.570312, 60.546875, 61.523438, 62.500000, 63.476562, 64.453125, 65.429688, 66.406250, 67.382812, 68.359375, 69.335938, 70.312500, 71.289062, 72.265625, 73.242188, 74.218750, 75.195312, 76.171875, 77.148438, 78.125000, 79.101562, 80.078125, 81.054688, 82.031250, 83.007812, 83.984375, 84.960938, 85.937500, 86.914062, 87.890625, 88.867188, 89.843750, 90.820312, 91.796875, 92.773438, 93.750000, 94.726562, 95.703125, 96.679688, 97.656250, 98.632812, 99.609375, 100.585938, 101.562500, 102.539062, 103.515625, 104.492188, 105.468750, 106.445312, 107.421875, 108.398438, 109.375000, 110.351562, 111.328125, 112.304688, 113.281250, 114.257812, 115.234375, 116.210938, 117.187500, 118.164062, 119.140625, 120.117188, 121.093750, 122.070312, 123.046875, 124.023438, 125.000000, 125.976562, 126.953125, 127.929688, 128.906250, 129.882812, 130.859375, 131.835938, 132.812500, 133.789062, 134.765625, 135.742188, 136.718750, 137.695312, 138.671875, 140.625000, 142.578125, 144.531250, 146.484375, 148.437500, 150.390625, 152.343750, 154.296875, 156.250000, 158.203125, 160.156250, 162.109375, 164.062500, 166.015625, 167.968750, 169.921875, 171.875000, 173.828125, 175.781250, 177.734375, 179.687500, 181.640625, 183.593750, 185.546875, 187.500000, 189.453125, 191.406250, 193.359375, 195.312500, 197.265625, 199.218750, 201.171875, 203.125000, 205.078125, 207.031250, 208.984375, 210.937500, 212.890625, 214.843750, 216.796875, 218.750000, 220.703125, 222.656250, 224.609375, 226.562500, 228.515625, 230.468750, 232.421875, 234.375000, 236.328125, 238.281250, 240.234375, 242.187500, 244.140625, 246.093750, 248.046875, 250.000000, 251.953125, 253.906250, 255.859375, 257.812500, 259.765625, 261.718750, 263.671875, 265.625000, 267.578125, 269.531250, 271.484375, 273.437500, 275.390625, 277.343750, 281.250000, 285.156250, 289.062500, 292.968750, 296.875000, 300.781250, 304.687500, 308.593750, 312.500000, 316.406250, 320.312500, 324.218750, 328.125000, 332.031250, 335.937500, 339.843750, 343.750000, 347.656250, 351.562500, 355.468750, 359.375000, 363.281250, 367.187500, 371.093750, 375.000000, 378.906250, 382.812500, 386.718750, 390.625000, 394.531250, 398.437500, 402.343750, 406.250000, 410.156250, 414.062500, 417.968750, 421.875000, 425.781250, 429.687500, 433.593750, 437.500000, 441.406250, 445.312500, 449.218750, 453.125000, 457.031250, 460.937500, 464.843750, 468.750000, 472.656250, 476.562500, 480.468750, 484.375000, 488.281250, 492.187500, 496.093750, 500.000000, 503.906250, 507.812500, 511.718750, 515.625000, 519.531250, 523.437500, 527.343750, 531.250000, 535.156250, 539.062500, 542.968750, 546.875000, 550.781250, 554.687500, 560.000000, 568.000000, 576.000000, 584.000000, 592.000000, 600.000000, 608.000000, 616.000000, 624.000000, 632.000000, 640.000000, 648.000000, 656.000000, 664.000000, 672.000000, 680.000000, 688.000000, 696.000000, 704.000000, 712.000000, 720.000000, 728.000000, 736.000000, 744.000000, 752.000000, 760.000000, 768.000000, 776.000000, 784.000000, 792.000000, 800.000000, 808.000000, 816.000000, 824.000000, 832.000000, 840.000000, 848.000000, 856.000000, 864.000000, 872.000000, 880.000000, 888.000000, 896.000000, 904.000000, 912.000000, 920.000000, 928.000000, 936.000000, 944.000000, 952.000000, 960.000000, 968.000000, 976.000000, 984.000000, 992.000000, 1000.000000, 1008.000000, 1016.000000, 1024.000000, 1032.000000, 1040.000000, 1048.000000, 1056.000000, 1064.000000, 1072.000000, 1080.000000, 1088.000000, 1096.000000, 1104.000000, 1112.000000, 1120.000000, 1128.000000, 1136.000000, 1144.000000, 1152.000000, 1160.000000, 1168.000000, 1176.000000, 1184.000000, 1192.000000, 1200.000000, 1208.000000, 1216.000000, 1224.000000, 1232.000000, 1240.000000, 1248.000000, 1256.000000, 1264.000000, 1272.000000, 1280.000000, 1288.000000, 1296.000000, 1304.000000, 1312.000000, 1320.000000, 1328.000000, 1336.000000, 1344.000000, 1352.000000, 1360.000000, 1368.000000, 1376.000000, 1384.000000, 1392.000000, 1400.000000, 1408.000000, 1416.000000, 1424.000000, 1432.000000, 1440.000000, 1448.000000, 1456.000000, 1464.000000, 1472.000000, 1480.000000, 1488.000000, 1496.000000, 1504.000000, 1512.000000, 1520.000000, 1528.000000, 1536.000000, 1544.000000, 1552.000000, 1560.000000, 1568.000000, 1576.000000, 1584.000000, 1592.000000, 1600.000000, 1608.000000, 1616.000000, 1624.000000, 1632.000000, 1640.000000, 1648.000000, 1656.000000, 1664.000000, 1672.000000, 1680.000000, 1688.000000, 1696.000000, 1704.000000, 1712.000000, 1720.000000, 1728.000000, 1736.000000, 1744.000000, 1752.000000, 1760.000000, 1768.000000, 1776.000000, 1784.000000, 1792.000000, 1800.000000, 1808.000000, 1816.000000, 1824.000000, 1832.000000, 1840.000000, 1848.000000, 1856.000000, 1866.665649, 1893.332275, 1919.998901, 1946.665527, 1973.332153, 1999.998779, 2026.665405, 2053.332031, 2079.998779, 2106.665527, 2133.332275, 2159.999023, 2186.665771, 2213.332520, 2239.999268, 2266.666016, 2293.332764, 2319.999512, 2346.666260, 2373.333008, 2399.999756, 2426.666504, 2453.333252, 2480.000000, 2506.666748, 2533.333496, 2560.000244, 2586.666992, 2613.333740, 2640.000488, 2666.667236, 2693.333984, 2720.000732, 2746.667480, 2773.334229, 2800.000977, 2826.667725, 2853.334473, 2880.001221, 2906.667969, 2933.334717, 2960.001465, 2986.668213, 3013.334961, 3040.001709, 3066.668457, 3093.335205, 3120.001953, 3146.668701, 3173.335449, 3200.002197, 3226.668945, 3253.335693, 3280.002441, 3306.669189, 3333.335938, 3360.002686, 3386.669434, 3413.336182, 3440.002930, 3466.669678, 3493.336426, 3520.003174, 3546.669922, 3573.336670, 3600.003418, 3626.670166, 3653.336914, 3680.003662, 3706.670410, 3733.337158, 3760.003906, 3786.670654, 3813.337402, 3840.004150, 3866.670898, 3893.337646, 3920.004395, 3946.671143, 3973.337891, 4000.004639, 4026.671387, 4053.338135, 4080.004883, 4106.671387, 4133.337891, 4160.004395, 4186.670898, 4213.337402, 4240.003906, 4266.670410, 4293.336914, 4320.003418, 4346.669922, 4373.336426, 4400.002930, 4426.669434, 4453.335938, 4480.002441, 4506.668945, 4533.335449, 4560.001953, 4586.668457, 4613.334961, 4640.001465, 4666.667969, 4693.334473, 4720.000977, 4746.667480, 4773.333984, 4800.000488, 4826.666992, 4853.333496, 4880.000000, 4906.666504, 4933.333008, 4959.999512, 4986.666016, 5013.332520, 5039.999023, 5066.665527, 5093.332031, 5119.998535, 5146.665039, 5173.331543, 5199.998047, 5226.664551, 5253.331055, 5279.997559, 5306.664062, 5333.330566, 5359.997070, 5386.663574, 5413.330078, 5439.996582, 5466.663086, 5493.329590, 5519.996094, 5546.662598, 5573.329102, 5599.995605, 5626.662109, 5653.328613, 5679.995117, 5706.661621, 5733.328125, 5759.994629, 5786.661133, 5813.327637, 5839.994141, 5866.660645, 5893.327148, 5919.993652, 5946.660156, 5973.326660, 5999.993164, 6026.659668, 6053.326172, 6079.992676, 6106.659180, 6133.325684, 6159.992188, 6186.658691, 6213.325195, 6239.991699, 6266.658203, 6293.324707, 6319.991211, 6346.657715, 6373.324219, 6399.990723, 6426.657227, 6453.323730, 6479.990234, 6506.656738, 6533.323242, 6559.989746, 6586.656250, 6613.322754, 6639.989258, 6666.655762, 6693.322266, 6719.988770, 6746.655273, 6773.321777, 6799.988281, 6826.654785, 6853.321289, 6879.987793, 6906.654297, 6933.320801, 6959.987305, 6986.653809, 7013.320312, 7039.986816, 7066.653320, 7093.319824, 7119.986328, 7146.652832, 7173.319336, 7199.985840, 7226.652344, 7253.318848, 7279.985352, 7306.651855, 7333.318359, 7359.984863, 7386.651367, 7413.317871, 7439.984375, 7466.650879, 7493.317383, 7519.983887, 7546.650391, 7573.316895, 7599.983398, 7626.649902, 7653.316406, 7679.982910, 7706.649414, 7733.315918, 7759.982422, 7786.648926, 7813.315430, 7839.981934, 7866.648438, 7893.314941, 7919.981445, 7946.647949, 7973.314453, 7999.980957, 8026.647461, 8053.313965, 8079.980469, 8106.646973, 8133.313477, 8159.979980, 8186.646484, 8213.313477, 8239.980469, 8266.647461, 8293.314453, 8319.981445, 8346.648438, 8373.315430, 8399.982422, 8426.649414, 8453.316406, 8479.983398, 8506.650391, 8533.317383, 8559.984375, 8586.651367, 8613.318359, 8639.985352, 8666.652344, 8693.319336, 8719.986328, 8746.653320, 8773.320312, 8799.987305, 8826.654297, 8853.321289, 8879.988281, 8906.655273, 8933.322266, 8959.989258, 8986.656250, 9013.323242, 9039.990234, 9066.657227, 9093.324219, 9119.991211, 9146.658203, 9173.325195, 9199.992188, 9226.659180, 9253.326172, 9279.993164, 9306.660156, 9333.327148, 9359.994141, 9386.661133, 9413.328125, 9439.995117, 9466.662109, 9493.329102, 9519.996094, 9546.663086, 9573.330078, 9600.000977, 9733.333984, 9866.666992, 10000.000000, 10133.333008, 10266.666016, 10399.999023, 10533.332031, 10666.665039, 10799.998047, 10933.331055, 11066.664062, 11199.997070, 11333.330078, 11466.663086, 11599.996094, 11733.329102, 11866.662109, 11999.995117, 12133.328125, 12266.661133, 12399.994141, 12533.327148, 12666.660156, 12799.993164, 12933.326172, 13066.659180, 13199.992188, 13333.325195, 13466.658203, 13599.991211, 13733.324219, 13866.657227, 13999.990234, 14133.323242, 14266.656250, 14399.989258, 14533.322266, 14666.655273, 14799.988281, 14933.321289, 15066.654297, 15199.987305, 15333.320312, 15466.653320, 15599.986328, 15733.319336, 15866.652344, 15999.985352, 16133.318359, 16266.651367, 16399.984375, 16533.318359, 16666.652344, 16799.986328, 16933.320312, 17066.654297, 17199.988281, 17333.322266, 17466.656250, 17599.990234, 17733.324219, 17866.658203, 17999.992188, 18133.326172, 18266.660156, 18399.994141, 18533.328125, 18666.662109, 18799.996094, 18933.330078, 19066.664062, 19199.998047, 19333.332031, 19466.666016, 19600.000000, 19733.333984, 19866.667969, 20000.001953];
end