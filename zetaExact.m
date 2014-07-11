function [ zeta ] = zetaExact( omegatr )

    dt =[0	1
    0.0152	1
    0.0226	1
    0.0299	1
    0.0351	1
    0.037	1
    0.0441	1
    0.0517	1
    0.0625	1
    0.0678	1
    0.0833	1
    0.0909	1
    0.0984	1
    0.1026	1
    0.1176	1
    0.1429	0.999998
    0.1463	0.999998
    0.1667	0.999988
    0.186	0.999957
    0.2222	0.999753
    0.2308	0.999654
    0.2553	0.999203
    0.2857	0.998155
    0.3255	0.995601
    0.3333	0.994905
    0.3741	0.989994
    0.375	0.989859
    0.4199	0.981522
    0.4349	0.977971
    0.4444	0.975508
    0.4727	0.967136
    0.4911	0.960819
    0.5	0.957504
    0.5131	0.952307
    0.5358	0.94237
    0.5445	0.938237
    0.5455	0.93775
    0.5468	0.937114
    0.5914	0.91266
    0.5991	0.9079
    0.6062	0.903363
    0.6125	0.899216
    0.6175	0.895842
    0.642	0.878224
    0.658	0.865698
    0.6782	0.848659
    0.6978	0.830736
    0.7077	0.821132
    0.7249	0.803512
    0.7597	0.763914
    0.7635	0.759242
    0.7638	0.75887
    0.8013	0.70853
    0.8014	0.708385
    0.8289	0.665923
    0.8291	0.665595
    0.8421	0.64357
    0.8581	0.614494
    0.8661	0.599049
    0.8868	0.55584
    0.8889	0.551164
    0.8897	0.549368
    0.8899	0.548917
    0.9065	0.50949
    0.9098	0.501128
    0.9143	0.489408
    0.9216	0.469557
    0.9236	0.463923
    0.9302	0.444671
    0.9303	0.444371
    0.9359	0.427151
    0.94	0.413976
    0.9412	0.410021
    0.9514	0.374352
    0.9563	0.3557
    0.9592	0.344107
    0.9669	0.310923
    0.9733	0.279983
    0.9777	0.256334
    0.9901	0.171653
    0.9934	0.140341
    0.995	0.122229
    0.996	0.109369
    0.9967	0.0993673];

    zeta = interp1(dt(:,1), dt(:,2), omegatr, 'cubic');