defmodule AdventofcodeTest do
  use ExUnit.Case
  doctest Adventofcode

  test "Returns the Elf carrying the most calories" do
    elfs = """
    3264
    4043
    2537
    3319
    2485
    3218
    5611
    1753
    7232
    3265
    1751
    2233

    10589
    5121
    11465
    9307
    1347
    9392
    12037

    6025
    4328
    3982
    4487
    1139
    1440
    2970
    3390
    1844
    5400
    1651
    4109
    3584
    2926
    4297

    8921
    13298
    12300
    5607
    3304
    5037

    1729
    10057

    3538
    3984
    3451
    5638
    2880
    1008
    2940
    6245
    3865
    5060
    2878
    2460
    6557

    1584
    6391
    3479
    2264
    2683
    3680
    1183
    5121
    6499
    5543
    1192
    4818

    1337
    8128
    8966
    7601
    7749
    5017
    3251
    1074
    6095

    11824
    17144
    5396
    15416

    6244
    6589
    4953
    4250
    1422
    1252
    4555
    5240
    4244
    4088

    27353

    6629
    7231
    7673
    7029
    6994
    6347
    6381
    1503
    2145
    1114
    6068

    3473
    3935
    4054
    3558
    3818
    5370
    4807
    2703
    5407
    2532
    6833
    1675

    20016
    7587
    13088

    3477
    3118
    5815
    3551
    2316
    4254
    4814
    5726
    5324
    6096
    3596
    3374
    3975
    4152
    1946

    4549
    3639
    6338
    6882
    3514
    6488
    2192
    4522
    4370
    3637
    3500
    2964
    1850

    6900
    5145
    13864
    8145
    4579

    1984
    1589
    9279
    10987
    5213

    3997
    1978
    5061
    2710
    2695
    4713
    5930
    3005
    6189
    2619
    6897
    5032
    2374

    1738
    6817
    1993
    13747
    8574
    13341

    3869
    1810
    3501
    1366
    4240
    2005
    6102
    6069
    4135
    6667
    1239
    2799
    1900

    4711
    1330
    9725
    5965
    8271
    11932

    5319
    6078
    1652
    1958
    1992
    1997
    2824
    6542
    1998
    2713
    6806
    4993
    6569

    9262

    3814
    11917
    4812
    1884
    3686
    10993

    8845
    6032
    9899
    10384
    3834
    2275

    3559
    2268
    1446

    2265
    5503
    5056
    2547
    7394
    2514
    8105
    4630
    9392

    2377
    10479
    3452
    9175
    13773

    6090
    1467
    2747
    9310
    2839
    9392
    10752
    5771

    8193
    4139
    4728
    5180
    5884
    9236

    5721
    10884
    10268
    3255
    2377
    11574
    4498

    17228
    7306
    6465

    69149

    6323
    3435
    2801
    6385
    4192
    1593
    4373
    6654
    7190
    6142

    10960
    3399
    12251
    8249
    8210
    3571

    2299
    4349
    1476
    5703
    1497
    4008
    1435
    5043
    2203
    4252
    2407
    5891

    1419
    1588

    4266
    2424
    1846
    3265
    5720
    5396
    2013
    2664
    4712
    1040
    3186
    1693
    1537
    3226

    15568
    16153
    15408
    9417
    15524

    18017
    4247
    1764
    18920

    14176
    18583

    4896
    1029
    14517
    10183
    9726

    5242
    4156
    2314
    4018
    3542
    1619
    5349
    2524
    2620
    4675
    6491
    5315
    3959
    5215

    2638
    5346
    6209
    1466
    2854
    6677
    2242
    8476
    5236

    3827
    4489
    7735
    5656
    11568
    12323

    8560
    7046
    5453
    4141
    1356
    8940
    8338
    3749
    7297

    10693
    7191
    8803
    10504
    2033
    6374
    6820
    10316

    5869
    12102
    12675
    7688
    10906
    12593

    9028
    8234
    4453
    2117
    7328
    9404
    6664
    7206
    6357

    3018
    5515
    6479
    1522
    4582
    5881
    4019
    1288
    5288
    4007
    5816
    2354
    5648
    5405

    4120
    3890
    11718
    5713
    6986
    10362
    5529

    8243
    2097
    10194
    3023
    11120
    9524
    2052

    12552
    14406
    3981
    9703
    10329

    7256
    9424
    4701

    5694
    1262
    3521
    4194
    3530
    7472
    1773
    1787
    6229
    6608
    5905
    3065

    3366

    15198
    25328

    3805
    4163
    4192
    4013
    2693
    3029
    4559
    5243
    3088
    4804
    1245
    1800
    4999
    3162
    6114

    3808
    3672
    6397
    3747
    4312
    5015
    4237
    5326
    3961
    1382
    1380
    5517
    1140

    3360
    6936
    3880
    4242
    7431
    5597
    6195
    5305
    1051
    1015
    1866
    3179

    17144
    2423
    8330

    5153
    2301
    4944
    1566
    5647
    6726
    6248
    1537
    6951
    1272
    1177
    2013

    7595
    9953
    19751
    14200

    2576
    1684
    6463
    6643
    2911
    1650
    2492
    5726
    4830
    6591
    4477
    6691
    6390

    5209
    5099
    1115
    5456
    4573
    5954
    4389
    1703
    1595
    1348
    5814
    4031
    3086
    4039
    5445

    3506
    3956
    1504
    5435
    5660
    6882
    1962
    4891
    2596
    3838
    7206
    5554

    10423
    4792
    16000
    12857
    5040

    7410
    2589
    6769
    8168
    7526
    4349

    5160
    12452
    13889
    7499
    1985
    12491

    1033
    9259
    6288
    5566
    6134
    11010
    7512

    5196
    4644
    1825
    5564
    5759
    7134
    5589
    5387
    1328
    2314
    4948
    7354

    6875
    2105
    3444
    6997
    3962
    1141
    2000
    7561
    6447
    5629
    7035

    1499
    7160
    5201
    3206
    2719
    5177
    6566
    3455
    3304
    1648
    3273

    6142
    3697
    2247
    6537
    5579
    7126
    2674
    1842
    1482
    5504
    1105

    5669
    7401
    8229
    6261
    4378
    5548
    2360
    5703
    7650
    2086

    23865
    10240
    2321

    4221
    8067
    1395
    1397
    5776
    5136
    6820
    1428
    3375
    6117
    4467

    2505
    4307
    5626
    8867

    4709
    5951
    3811
    4998
    4460
    6243
    1790
    2172
    5694
    6245
    3273
    2664
    4813
    5669

    5803
    4856
    2508
    6301
    4454
    2430
    4868
    4883
    6211
    1749
    2998
    3450
    2414
    5617

    9135
    8583
    7582
    8349
    7609
    4434
    8362
    3472

    44093

    7933
    3349
    6041
    3238
    5036
    9100
    4252

    14356
    24185

    11887
    23333
    16694

    6324
    1438
    5180
    5329
    6798
    4806
    5285
    4757
    4599
    3897
    2308
    5014

    1455
    4268
    1903
    1436
    4563
    5135
    4876
    6561
    4776
    3530
    3080
    5724
    5520

    3419
    2363
    4474
    6069
    2504
    6749
    4094
    5991
    8045
    1302
    5649

    20607
    13990

    7588
    9960
    8919
    11254
    6295
    3856
    10295

    1161
    3773
    1559
    1198
    5967
    5237
    3369
    4437
    7698
    2756
    2639

    43493

    18577
    2593
    16336
    13785

    6567
    2409
    8001
    4173
    11587
    8238
    3023

    5146
    10077
    2630
    4827
    6199
    3701
    3840
    3068

    3272
    5212
    3674
    5352
    3129
    4242
    2711
    3064
    4987
    5362
    4858
    3180
    6090
    2265
    4791

    14702
    1034

    12170
    8780
    14933
    3727

    4239
    7116
    1120
    7853
    7862
    5512
    2309
    3094
    6359

    9172
    12494
    8382

    8629
    11921
    9629
    11535
    7792
    9996

    6887
    10548
    3429
    2373
    6208
    5406
    5440

    2164
    3233
    1512
    1556
    5476
    3462
    4261
    3563
    2409
    6236
    2568
    4638
    4775
    1131

    27798
    30212

    5409
    4676
    5445
    2119
    3557
    1135
    6724
    2779
    1324
    2157
    4456
    6329
    2155

    4084
    1379
    7443
    12904

    7167
    12163
    9588
    11186
    9015

    35132
    18974

    3418

    12568
    1418
    7691
    12369
    1144
    6141

    2523
    5150
    2276
    6036
    1492
    5069
    5782
    2999
    4505
    2347
    1234
    5376
    3356
    2489
    1456

    30181

    3189
    2572
    5145
    4350
    6403
    1285
    5678
    3796
    3792
    2334
    2710
    3536
    5580

    2991
    7718
    1798
    5300
    11608
    3376
    11658

    58468

    6099
    4433
    7634
    7768
    3804
    5523
    6959
    4752
    8693
    2705

    5315
    4218

    5678
    2293
    2385
    2568
    1644
    3332
    5968
    4159
    5935
    2667
    4518
    2823
    4648
    3072
    5644

    14306
    7557
    15251
    6896
    14250

    10549
    1662
    10040
    2614
    4843
    1111
    9585

    9531
    2249
    1949
    8715
    9466
    1471
    7952

    2585
    8702
    10548
    12849
    5342
    10193

    21463
    24241
    9125

    36676

    18212
    11298
    8690

    6861
    1095
    4586
    1260
    2795
    3208
    4650
    4147
    5764
    1051
    6882
    5670

    16681
    22273
    1336

    3370
    3537
    2062
    4985
    2063
    2339
    5988
    3777
    5822
    2760
    1915
    4668
    4717
    5847
    4598

    5829
    4829
    4872
    3893
    5320
    1832
    7637
    7137
    6079
    3006
    7422

    34780
    21066

    1164
    3444
    8079
    4633
    5030
    8296
    8703
    7929
    8767
    4489

    1950
    5492
    4920
    3849
    6553
    1802
    1574
    4962
    1671
    2382
    4990
    2511
    3485

    6003
    8237

    10793
    12510
    2959
    9397
    6153

    7943
    1934
    3817
    7937
    6856
    3813
    4408
    8046
    4605
    3994
    8081

    10589
    11870
    8367
    7889
    10172
    9758
    9447

    6566
    4971
    4600
    6863
    4212
    5240
    6523
    7979
    2695
    4934

    6527
    2008
    4595
    7104
    7497
    10199
    6640
    7909

    7970
    7026
    4812
    4331
    3244
    5260
    3089
    2871
    3915
    1445

    3182
    9915
    5769
    6470
    10524
    7486
    5041

    5575

    6482
    2235
    2834
    3999
    4428
    1713
    3366
    4477
    2282
    1331
    5095
    5268
    5482
    3409

    21109

    8502
    2007
    3250
    6035
    6099
    2605
    6323
    5532
    3677
    8194

    11224
    1704
    10152
    11640
    1018
    7016
    2700

    12204

    1191
    5039
    5036
    3778
    1669
    5277
    5345
    3833
    5379
    1286
    2042
    5365
    4518
    5517

    2750
    4544
    3817
    5392
    1745
    4056
    1557
    1819
    6187
    4867
    6445
    4475
    3026
    5516

    13176
    25505
    2657

    29617
    4098

    1733
    3055
    3730
    5327
    3111
    4912
    1842
    2471
    1964
    2747
    1573
    4097
    5558
    4940
    2065

    1177
    3510
    6178
    1267
    9395
    1387
    1251
    9112
    1265

    4073
    8822

    5585
    4905
    1005
    4303
    2129
    1565
    1577
    1747
    7097
    7135
    2546

    6368
    6384
    1873
    2027
    2111
    5781
    4392
    1640
    1874
    5147
    6551
    4992

    11673
    15872
    10747
    5457

    7576
    6084
    3279
    5582
    8329
    7176
    6561
    5342
    8481
    6333

    7617
    12916
    8957
    17210

    4173
    1088
    5981
    2094
    4598
    3192
    3968
    1486
    3888
    4186
    5948
    3764
    3173
    1597
    5057

    7430
    3183
    20030
    4003

    5891
    6434
    2213
    1762
    6106
    7550
    6766
    6075
    1119
    4462

    2460
    7385
    3906
    2805
    2519
    2189
    6803
    2705
    5167
    2972
    6855
    6996

    3922
    4300
    2172
    7515
    9388
    8687
    5087
    6373
    4001

    3288
    3888
    3873
    7575
    1902
    3315
    4831
    3272
    4914

    2120
    3223
    3582
    4864
    1944
    2625
    2666
    1710
    2511
    4362
    3073
    3994
    3171

    8037
    2890
    3124
    8901
    1411
    6858
    5184
    1294
    7790

    7884
    7169
    4372
    5820
    6836
    2878
    7608
    2434
    8600
    8117

    33732
    17277

    31526
    6202

    6081
    5669
    1460
    7548
    1054
    3713
    8470

    7033
    4205
    4404
    4261
    2975
    7865
    5190
    1675
    1349
    7748

    7345
    6389
    3056
    2777
    12209
    10038

    5285
    7634
    5875
    6074
    3076
    2687
    4342
    5471
    4113

    2993
    10714
    5204
    6732
    4746
    12416

    19555
    17202
    13776
    6280

    2820
    11278
    6160
    9522
    6585

    9093
    6397
    10417
    4902
    4899

    5602
    4917
    4964
    5689
    4316
    4041
    5290
    3223
    4065
    3514
    3552
    5864
    4823
    6481

    3239
    5151
    2862
    4568
    1964
    3003
    3575
    4445
    6875
    5511
    1591
    1681
    6874

    7348
    1881
    7702
    6305
    2373
    6320
    1544
    2897
    2784
    5977
    6964

    1757
    7460
    5212
    3491
    1157
    3753
    1983
    3015
    1298
    2812
    3569
    4680

    22481

    8578
    7141
    11229
    5622
    13937
    1699

    3479
    1258
    2782
    5573
    7720
    6726
    4043
    3059
    5028
    8075

    3232
    6633
    5344
    1862
    6215
    3674
    2507
    5509
    1982
    4422
    1709

    2759
    2497
    3959
    1725
    2430
    3256
    1416
    4213
    3452
    6809
    6817
    3151

    5187
    2502
    6982
    3414
    11460
    12085
    5775

    1490
    4368
    4135
    1494
    5683
    5443
    5182
    6209
    3240
    1433
    3373
    3048
    5768
    4132

    22305
    10502

    6633
    2336
    6714
    3046
    4740
    4650
    2901
    5832
    5690
    4211
    6168
    4901
    2448

    8640
    11265
    10961
    10744
    10955

    16404
    15126
    4253
    1372

    9862
    9547
    20599

    8872
    3452
    2169
    7757
    5535
    9697
    8147
    8775

    14862

    68282

    4343
    11948
    2346
    16745

    12892
    12538
    15571
    11814

    4406
    1323
    3769
    5868
    5023
    6057
    5967
    2891
    2778
    5696
    4376
    2244
    4102
    4721

    8420

    8564
    2803
    11178
    17801

    34616

    4635
    3716
    6634
    3494
    2905
    4254
    8053
    4871
    5523
    5088
    2928

    7447
    16669
    9215
    14663

    4248
    3260
    3347
    5552
    4781
    1715
    5642
    5414
    3223
    3043
    3415
    6463
    5932

    29980
    37187

    9703
    7176
    8191
    10002
    7145
    5926
    10760
    7384

    32599
    26889

    5843
    1632
    3871
    5645
    9544
    3097
    1820

    6941
    4838
    5440
    4389
    5309
    5449
    5897
    4418
    4641
    6905
    4951
    2198
    1031

    4553
    1428
    4164
    2850
    1146
    2496
    4807
    4776
    1573
    2865
    1225
    5182
    2617
    1514
    5828

    5660
    1567
    5066
    4985
    4683
    4819
    3894
    4432
    5188
    4791
    5916
    3867
    4285
    5863
    5570

    5394
    3391
    4052
    3230
    4524
    1059
    3685
    1808
    2161
    2662
    3718
    5945
    5094
    4867
    4258

    28646
    31561

    11012
    2804
    5719
    5299
    2500
    11059

    1318
    5060
    1097
    5290
    1059
    3435
    1082
    6242
    1623
    2004
    3567
    1725
    5056

    4643
    5165
    14091
    6412
    13186

    5560

    7978
    4943
    8311
    6023
    15930

    1972
    7310
    6563
    1748
    6142
    4529
    2106
    7066
    4598
    7301
    2132
    4005

    1173
    6436
    6047
    5197
    6500
    4588
    5341
    4781
    4750
    4244
    1199
    4931
    4863
    5628

    10302
    8627
    5405
    6570
    11439
    1447

    22318
    21787
    9491

    4710
    4259
    5894
    2971
    4273
    4994
    3414
    4179
    2483
    5404
    1646
    3099
    4035
    4066

    6374
    8210
    4288
    2226
    3271
    8759
    6171
    7020
    8299
    1958

    2744
    6690
    1431
    5118
    5387
    7128
    5517
    6299
    7515
    4304
    1846

    1941
    1309
    1888
    4992
    5942
    4182
    2334
    3283
    4907
    2610
    3373
    2936
    1908

    3400
    6953
    5233
    5348
    8743
    2799
    7890
    1898
    7783

    38934

    3843
    1038
    3364
    6113
    3952
    7192
    5767
    3932
    4462
    2088
    3925
    3990

    2596
    10301
    11026
    12033
    2542
    13448

    4798
    6076
    3906
    1617
    8462
    2051
    4827
    1905
    5940
    7175

    8305
    6626
    1600
    5228
    6332
    1206
    4840
    4600
    5363

    6425
    13475
    11305
    14037

    6154
    1016
    3673
    1827
    3628
    4238
    2483
    4762
    3413
    3148
    4659
    3451
    6465
    2363

    35242
    27022

    2722
    11484
    12323
    6822
    7951
    4387

    36866

    5755
    20057
    5657

    2491
    2205
    3527
    9556
    8363
    3109
    8618
    1481
    6234

    7365
    1920
    1578
    3271
    3325
    1263
    1816
    7031
    8020
    2353
    3127

    8027
    13092
    7531
    12350

    10451
    9259
    13080
    12849

    3984
    2140
    2655
    2766
    8665
    2282
    4391
    1435
    4821
    4977

    2366

    6198
    17922
    22945

    2077
    6263
    11643
    11377
    3735
    11634
    5022

    16598
    7968

    31400
    22664

    5414
    5057
    1898
    3063
    4075
    2527
    3502
    6713
    3109
    6376
    2487
    2279
    1057

    12654
    11007
    2365
    8272
    2895

    15798
    3536
    14549

    1066
    1181
    6142
    9592
    3412
    8683

    3274
    1129
    1645
    4784
    4039
    5447
    4766
    1310
    3346
    4062
    2219
    4290
    4733
    3033
    1306

    2006
    2898
    3600
    1802
    4760
    5306
    1000
    1279
    1205
    5224
    2652
    4914
    4042
    1559

    20342
    16632

    18586
    1712
    11316
    16623

    7964
    6856
    7863
    7417
    4608
    7216
    4263
    6552
    3187

    6415
    2442
    2928
    4853
    6899
    6747
    3803
    3522
    5680
    6184
    3326
    5707
    1695

    61737

    18154
    7052

    4635
    3560
    8043
    5917
    9440
    7535
    7213
    7625

    3389
    1034
    4154
    4872
    4843
    2238
    1174
    2922
    1067
    5715
    5093
    3302
    1076
    3017
    4711

    9322
    11596
    6347
    11332
    9376
    9230

    6475
    6492
    4953
    6492
    3935
    2286
    7152
    4659
    5762
    4989
    6438
    1020

    """
    assert Adventofcode.findHighestCalorieElf(elfs) === 72070
  end
end
