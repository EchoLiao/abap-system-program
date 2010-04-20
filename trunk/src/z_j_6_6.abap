report z_j_6_6.
selection-screen begin of line. " 在同一行上
    selection-screen comment 1(10) s2.
    parameters: a1(1) type c,
                a2(4) type c,
                s3(2) type p.
selection-screen end of line.

initialization.
    s2 = 'test:'.
