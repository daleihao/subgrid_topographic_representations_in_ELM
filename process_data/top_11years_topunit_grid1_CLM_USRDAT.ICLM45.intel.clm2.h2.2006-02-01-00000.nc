CDF      
      lndgrid       gridcell      topounit      landunit   ;   column     �   pft   o   levgrnd       levurb        levlak     
   numrad        month         levsno        ltype      	   nvegwcs       natpft        string_length         levdcmp       levtrc     
   hist_interval         time             title         CLM History file information   comment       :NOTE: None of the variables are weighted by land fraction!     Conventions       CF-1.0     history       created on 03/28/21 23:06:04   source        Community Land Model CLM4.0    hostname      cori-knl   username      daleihao   version       	9b6fddd6f      revision_id       9$Id: histFileMod.F90 42903 2012-12-21 15:32:10Z muszala $      
case_title        UNSET      case_id       1top_11years_topunit_grid1_CLM_USRDAT.ICLM45.intel      Surface_dataset       "surfdata_Topunit_grid_1_c210326.nc     Initial_conditions_dataset        Gspinup_topunit_grid1_CLM_USRDAT.ICLM45.intel.clm2.r.2000-01-01-00000.nc    #PFT_physiological_constants_dataset       clm_params_c180301.nc      ltype_vegetated_or_bare_soil            
ltype_crop              ltype_landice               (ltype_landice_multiple_elevation_classes            ltype_deep_lake             ltype_wetland               ltype_urban_tbd             ltype_urban_hd              ltype_urban_md           	   Time_constant_3Dvars_filename         O./top_11years_topunit_grid1_CLM_USRDAT.ICLM45.intel.clm2.h0.2000-01-01-00000.nc    Time_constant_3Dvars      /ZSOI:DZSOI:WATSAT:SUCSAT:BSW:HKSAT:ZLAKE:DZLAKE       3   levgrnd                	long_name         coordinate soil levels     units         m         <      +�   levlak                 	long_name         coordinate lake levels     units         m         (      ,8   levdcmp                	long_name         coordinate soil levels     units         m         <      ,`   time               	long_name         time   units         days since 2000-01-01 00:00:00     calendar      noleap     bounds        time_bounds             -�   mcdate                 	long_name         current date (YYYYMMDD)             -�   mcsec                  	long_name         current seconds of current date    units         s               -�   mdcur                  	long_name         current day (from base day)             -�   mscur                  	long_name         current seconds of current day              -�   nstep                  	long_name         	time step               -�   time_bounds                   	long_name         history time interval endpoints             -�   date_written                             -�   time_written                             .   lon                 	long_name         coordinate longitude   units         degrees_east   
_FillValue        {@��   missing_value         {@��      ,      ,�   lat                 	long_name         coordinate latitude    units         degrees_north      
_FillValue        {@��   missing_value         {@��      ,      ,�   area                	long_name         grid cell areas    units         km^2   
_FillValue        {@��   missing_value         {@��      ,      ,�   topo                	long_name         grid cell topography   units         m      
_FillValue        {@��   missing_value         {@��      ,      -    landfrac                	long_name         land fraction      
_FillValue        {@��   missing_value         {@��      ,      -L   landmask                	long_name         &land/ocean mask (0.=ocean and 1.=land)     
_FillValue        ����   missing_value         ����      ,      -x   pftmask                 	long_name         (pft real/fake mask (0.=fake and 1.=real)   
_FillValue        ����   missing_value         ����      ,      -�   EFLX_LH_TOT                    	long_name         !total latent heat flux [+ to atm]      units         W/m^2      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      .   FGR                    	long_name         Oheat flux into soil/snow including snow melt and lake / snow light transmission    units         W/m^2      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      .D   FIRA                   	long_name         !net infrared (longwave) radiation      units         W/m^2      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      .p   FIRE                   	long_name         %emitted infrared (longwave) radiation      units         W/m^2      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      .�   FLDS                   	long_name         atmospheric longwave radiation     units         W/m^2      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      .�   FPSN                   	long_name         photosynthesis     units         umol/m2s   cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      .�   FSA                    	long_name         absorbed solar radiation   units         W/m^2      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      /    FSDS                   	long_name         $atmospheric incident solar radiation   units         W/m^2      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      /L   FSH                    	long_name         sensible heat      units         W/m^2      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      /x   FSNO                   	long_name         "fraction of ground covered by snow     units         unitless   cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      /�   FSR                    	long_name         reflected solar radiation      units         W/m^2      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      /�   FV                     	long_name          friction velocity for dust model   units         m/s    cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      /�   H2OSNO                     	long_name         snow depth (liquid water)      units         mm     cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      0(   LH_pft                     	long_name         0patch total latent heat flux (W/m**2) [+ to atm]   units         W/m^2      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      0T   PSNSHA                     	long_name         shaded leaf photosynthesis     units         umolCO2/m^2/s      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      0�   PSNSUN                     	long_name         sunlit leaf photosynthesis     units         umolCO2/m^2/s      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      0�   Q2M                    	long_name         2m specific humidity   units         kg/kg      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      0�   QBOT                   	long_name         atmospheric specific humidity      units         kg/kg      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      1   QOVER                      	long_name         surface runoff     units         mm/s   cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      10   QRUNOFF                    	long_name         0total liquid runoff (does not include QSNWCPICE)   units         mm/s   cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      1\   QSNOMELT                   	long_name         	snow melt      units         mm/s   cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      1�   Qh                     	long_name         sensible heat      units         W/m^2      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      1�   RHO                    	long_name         )air density at atmospheric forcing height      units         kg/m**3    cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      1�   SH_pft                     	long_name         2patch total sensible heat flux (W/m**2) [+ to atm]     units         W/m^2      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      2   SNOWDP                     	long_name         gridcell mean snow height      units         m      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      28   TBOT                   	long_name         atmospheric air temperature    units         K      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      2d   TG                     	long_name         ground temperature     units         K      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      2�   TSA                    	long_name         2m air temperature     units         K      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      2�   	TSOI_10CM                      	long_name         $soil temperature in top 10cm of soil   units         K      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      2�   TV                     	long_name         vegetation temperature     units         K      cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      3   ustar_patch                    	long_name         friction velocity [m/s]    units         m/s    cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      3@   
zeta_patch                     	long_name         1dimensionless height used in Monin-Obukhov theory      units         unitless   cell_methods      
time: mean     
_FillValue        {@��   missing_value         {@��      ,      3l;�r<���=�=�o�>YI:>�l�?�~?��?�#'@7U�@��,@��rAN�A���B��=L��?��@ff@�33A��AI��A���A���B	L�B3�;�r<���=�=�o�>YI:>�l�?�~?��?�#'@7U�@��,@��rAN�A���B����� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� B  B  B  B  B  B  B  B  B  B  B  K�K�K�K�K�K�K�K�K�K�K�                                            ?�  ?�  ?�  ?�  ?�  ?�  ?�  ?�  ?�  ?�  ?�                                                                    E
� 2)      �     �p@�     @�Z     03/28/21        23:06:04        A�"A��A�/�A���A���A�+�Aq�Ap�{Ai��Aj�Avk�@��?��U@�*?�[��b��?m�h?�B�?�_�?�E,?���?�k�BJ�mBL��BL�BL��BY4!BN�BN��BM��BM��BN�BM��C�AvC�v�C�{JC���C�
MC��eC��&C��'C���C���C��DC���C���C���C���C���C���C���C���C���C���C���?�)-?pj�?d(?Q��?��?$�>��>�ӡ>n��>C�=��B���B�c@B��B�-�B�EB���B�FB��B�-�B�j~B���B�nWB�nWB�nWB�nWB�nWB�nWB�nWB�nWB�nWB�nWB�nWA:W�A+F�A+-�A ��A0�A-A��A ��A ѡA�9A��>!A�>=>J�>m(=�Bi=��=��=�f�=���=��>��A�`A@X�AEJ�Ab�Ac@�A���A��,A���A��A�dA��f>��&>��K>}�f>j�>F��>D5�>7��>/h>'T�>%��>!��@a��@FZ@7Ir@(��?��|@ǳ@oY@��@$�@)Y�@0��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��?w�?��?�I?��>��r?=M>��L>�CH>�T�>��>P�a?��?�i1?���?��?��?�P�?��?��?��Q@ rw?�W|;��,;���;���;�?;�67;�{�;���;��r;���;��{;��;�#`;�#`;�#`;�#`;�#`;�#`;�#`;�#`;�#`;�#`;�#`7K~[7H5�7K��7K��7#�C7J {7KA�7L�W7M��7RZ7O��8�n 8���8�U�8�ku8��8���8�m+8���8��N8�AA8�?8	�8|�8&L8v�8�8"�8�-8	�8	ޭ8/�8	� A:W�A+F�A+-�A ��A0�A-A��A ��A ѡA�9A��?���?���?���?���?���?���?���?���?���?���?���{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��<�~3<���<�<�i<d�z<���<��<�WL<���<���<��GC���C���C���C���C���C���C���C���C���C���C���C�Z$C�o�C�r�C�~�C��C���C��bC��)C��\C��iC���C�h�C�m�C�oC�nMC�}aC�n�C�o\C�i"C�f�C�gZC�e�C���C�¾C�ǆC��
C��C�۠C��TC��C��C��#C���C�t�C��C��C���C��C���C���C��xC��C��OC���>��&>��K>}�f>j�>F��>D5�>7��>/h>'T�>%��>!��>�폾ci�/y��=bm����C�ͿD/�í������L���JE� 2�      �     ��@�Z     @��     03/28/21        23:07:29        A�rAA�E�A��A�<A�#�A��ZA�a?A�A�eSA��l?Hyj?��b?��??t����e�?��?iLg?]�(?{+�?��m?z��B�=�B��iB���B�5nB���B�ZB�%B�u�B���B���B��9C�,�C��C��C��C�>�C��C�f�C�:�C��C�-C�HC:tC:tC:tC:tC:tC:tC:tC:tC:tC:tC:t?�Z+?���?�Z�?�O#?:�'?0x?	]>��v>���>T�x>��B�z�B�wB���B�<�B��B���B�mHB���B���BŰ�Bǰ"CʊCʊCʊCʊCʊCʊCʊCʊCʊCʊCʊA���A��DA���A� �A~�TADe A2R�A(K[A�EA#p�A��>+M>%��>$`>>&�>0�>/��>@�f>FH�>K�j>L!>M.�AxҶA�&tA��A�a�AϘ�B	��BO�B��B%1B#ȐB��>�7>���>���>�H�>s)>l�
>YS�>R>>I��>IQ8>E��@�F�@��K@��7@��@��R@�@���@�EB@ϫ�@ϰ�@�P�{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��?A?>v�?B -?=��?o�?!Z?6�>�)�>�O�>�$�>WA?�F?�/�?�l<?�a�?���@L�@r+@��@�C@�5@�};���;��O;���;��;��;��J;�7�;��;���;�X�;��);}/);}/);}/);}/);}/);}/);}/);}/);}/);}/);}/)6�k�6�O6���6��n6ȯ�6�l�6��6��6�Y6�!6�b8�8���8�<�8���8�΄8��8���8��8��u8�|�8��7�h�7��7��|7���7��7�dT7��7��7�A7�eR7���A���A��DA���A� �A~�TADe A2R�A(K[A�EA#p�A��?��k?��k?��k?��k?��k?��k?��k?��k?��k?��k?��k{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��=@�)=}]=~K=}�=NW#=��=�6=���=��=�s�=��*C�^�C�^�C�^�C�^�C�^�C�^�C�^�C�^�C�^�C�^�C�^�C�4�C�ULC�X.C�_3C�ŔC�x�C�o�C�i�C�f�C�kC�iC�:�C�4C�2zC�.C�7�C�&�C��C�8C��C��C��C���C���C���C���C�ˮC���C��C��)C���C��C��C�^�C�a�C�c�C�d�C�m�C�e�C�j;C�e6C�\�C�a!C�b[>�7>���>���>�H�>s)>l�
>YS�>R>>I��>IQ8>E��>Ck��N"<�s,����_W��[8�Y޿g �@Ǔ�Hڢ�y�E� 2�      �     ��@��     @��     03/28/21        23:09:10        B	"B�;B	��B�A���A��A�7YA΄(A��OA«�A���A��:A��xA�fA��A�qCA�h�A��kA�/�A�gVA�l�A��Bb�HBd��Be��Be��Bq?�Bd��Bb�ZBa!=B_�B_��B^]C�#�C�alC�y�C�w�C��cC�aC�!�C��C��oC���C���C��nC��nC��nC��nC��nC��nC��nC��nC��nC��nC��n?�Dg?���?��?��?LW2?CR�?+i>�`>i;>2ʿ=�"�C&��C�=C��C�C�C�C�EB� 0B�B�ǅB�5�C=�hC=�hC=�hC=�hC=�hC=�hC=�hC=�hC=�hC=�hC=�hBUd�B/�B&J"B:aB 1cA��XA���A�3�A�LoA�6CA�!_>�)m>���>�=�>�Sy>�>�ͪ>Ơh>�j>֬:>א�>�}.A��JA�1UB��B%+BQ9BRuhBǰBz	>B�
�B�]JB���>��>�K�>�	�>�Ɇ>��>�>��+>w>j��>h�i>bD�B�A�2�A��A��
A��
A��lA��B�&BqoB�|B$m{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��?]��?^G|?a&�?[��?%�?;��? ��>�	5>��	>�E�>d�?��?�J�@O�@�?㨌@�@~�@#+�@��@��?��j;���;�m�;���;�ҥ;���;��;��;���;���;���;���;��;��;��;��;��;��;��;��;��;��;��7��[7��7��[7�nw7���7�G�7��]7��7��e7���7�Ig8��8��.8�Wy8���8�+�8��j8���8�UN8���8��-8��8�mp8��Q8�Bt8��^8�l�8��08ċ�8�kQ8���8�S8�,�BUd�B/�B&J"B:aB 1cA��XA���A�3�A�LoA�6CA�!_?���?���?���?���?���?���?���?���?���?���?���{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��> z!=��=�7�=�v�=��?=��`=�Z2>�>��>��>�fC���C���C���C���C���C���C���C���C���C���C���C��C��<C��C��C���C�0C�&�C�]C��C��C�:C���C��$C���C���C���C��pC��OC���C��C���C��XC���C���C���C���C��C�nC�:oC�D�C�YbC�`�C�pC�?C�TAC�dPC�lbC�LC�t�C��C�|�C�{C�~C�q�>��>�K�>�	�>�Ɇ>��>�>��+>w>j��>h�i>bD�>���(aE�̖��Fp��3˽��Ͼ�V��(��׿`#�3PE` 2U      	     � @��     @�     03/28/21        23:10:38        B���B�f	B�ɳB�cB=B�ÀBw��BlYsBjN�Bf��B{)�Ak�A~�PAu�zA|j	A�,�A���A�y A�O�A���A� �A��gBD2/BIL4BKG�BN^�BV�lBV"�B[ԀB_;�Ba�OBchBb�+C�S�C��	C�6�C��WC���C���C�HC���C��C�:�C�*hC�͂C�͂C�͂C�͂C�͂C�͂C�͂C�͂C�͂C�͂C�͂@�R�@r%�@^��@L�@��@�?��`?��?M�?�A>�}�CWx4CS��CRvvCO�3CP�6CJ/OCH�1CG��CG'�CG�CI�ClJEClJEClJEClJEClJEClJEClJEClJEClJEClJEClJEB��WB�`B�$�B���Br��B�P�B���B�E�B��*B��EB�ς=��:=Wwc=[Zm=MT=	ҋ=-Zb=(ũ='~�=&ҙ=&�d=&8TA���A��AΞvA��A�pxBk�BdRBY�B�B<�B	@�?M�>�;>��v>���>�T�>���>��>���>�v>��X>�Bj?n̓?<u?A�]?0�^>�?�"?�?��?6?�k?Sq{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��?�ud?�k??�"c?���?�c�?�q�?���?��?v��?F�?Ś@^I�@yK%@��Y@�=�@l*@���@��@��@� �@�w@��T;�t ;�_z;�c;Ȼ�;ʁ�;�gg;�+;���;�h;��;ɔ�;�a�;�a�;�a�;�a�;�a�;�a�;�a�;�a�;�a�;�a�;�a�7{R�7��7��%7��47Q�N7���7�D�7�]`7��7�A�7�uu8��,8٫8�&8�>C8���8� K8�~8�*8�#Q8�>28�V 7�.�7�/7�F�7�i�7␦7�O�7��l7���7��7��7�OB��WB�`B�$�B���Br��B�P�B���B�E�B��*B��EB�ς?���?���?���?���?���?���?���?���?���?���?���{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��< �m<4�<Կ<�s;���;���;د�;�1M;���;۠�;�-mC�KrC�KrC�KrC�KrC�KrC�KrC�KrC�KrC�KrC�KrC�KrC��EC�D�C�Y�C���C���C��C�C��C� 1C�(fC�C��@C��C��UC���C���C��<C��C���C���C��)C���C��C�.�C�D�C�o�C��*C��pC���C��C��C��C��C��C�-IC�?;C�OmC�'VC�oRC��XC���C��LC��oC��'?M�>�;>��v>���>�T�>���>��>���>�v>��X>�Bj��>پt�B����+���J� �F�0HٿI��c�%�l�~��i%EP 2�      	%     ��@�     @�J     03/28/21        23:12:05        B��BŌ�B�B�e5B��B��XB���B�gB�fyB|2yBy��@��A�W@��ZA��A�fbA(�_A#9#A#܅A%��A$�A(��B�[�B��pB�45B�3B��2B��B��#B���B�}DB�|�B��iC�UC��C�G�C��?C�0C�,�C�9{C�:&C��Cƙ�C�5�C��rC��rC��rC��rC��rC��rC��rC��rC��rC��rC��r@�N�@��@�3�@Ų}@�cf@��@��@;�@��?�yF?\��C���C���C��pC�Z�C���C�6�C�E�C���C�G�C���C��C�߄C�߄C�߄C�߄C�߄C�߄C�߄C�߄C�߄C�߄C�߄BʥWB�0qB��B�86B���B�B���B�o�B���B�T1BȢ�                                            A�>�A��_A��6B&�B��B%F�B,�B0��B4��B1��B(4>�b>��>�a�>�O�>��>�~}>��N>�H�>� �>��{>�6�                                            {@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��@X�@"��@,ͼ@2�@8@1��@1t�@�l@1?�H?�1d@�CW@��@Ψ�@ؑ�@��@�"�@���ATsAU�A��A��< 6P< �Z< �< �<ެ< �)< 0�;�t ;�%�;���< 8;���;���;���;���;���;���;���;���;���;���;���5��e5�Z|5��'5�P�5��f5�w5��^5���5�|5���5�l�8H_8fs�8mY8m|�8J#�8o=e8���8�&�8��i8�B�8�q94;��4<L�4@�E4B64:�4A�4H@�4K�H4N�14P�}4T�\BʥWB�0qB��B�86B���B�B���B�o�B���B�T1BȢ�? .? .? .? .? .? .? .? .? .? .? .{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��                                            C���C���C���C���C���C���C���C���C���C���C���C�O.C��@C�؍C�%}C���C���C��C�pC�'�C�,VC�-�C���C���C��eC���C��C��BC��xC��C���C��EC���C��C�i�C���C��4C�^#C��mC��C���C��^C���C���C�KC�)�C�=HC�Y C�V>C���C���C��bC��C�"�C��>�b>��>�a�>�O�>��>�~}>��N>�H�>� �>��{>�6�>��6�(r�=�(�����l�ο6?x�9�ci����9��Kݿ�y�E0 2      	C     ��@�J     @��     03/28/21        23:13:33        B��Bq��BaN�BWH�B���BR��B<H�B# �B'�B�1A࿘A�~A-&tA%��A/̲A�]�AO,�AO|�AV�4A]#�A_}�Ad+�B��FB�qB�	�B� �B��B��~B�X�B�*�B�BB� B�PRC�`�C�+KC��C��XC��ZC�_NCӻTC���C�5�C��/C�9CC�%/C�%/C�%/C�%/C�%/C�%/C�%/C�%/C�%/C�%/C�%/@�ˌ@�t�@�^X@�k@l�W@�G@|6d@M1�@ �@+�?���C�'9C���C���C�2�C��dC���C���C��C�o6C��-C��3C���C���C���C���C���C���C���C���C���C���C���CZ�CP�CuqC
KB��B��^B�.C pC�BCt�C9�                                            A��B�`B�B��B�%B9��BBaBF�jBL�BI��B@��>�@�>�]�>�t>��h>���>��D>�|D>��J>�=>�QK>��                                            {@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��?�ڶ?�Jv?�U�?�m�?�W�@ �	@�@	�(@z?��O?�ES@m��@zw�@���@�N�@lB�@���@���@�/�@�y\@��@���;�f�;��;ԡv;��K;�*�;�W;�3�;�$�;�E�;�7R;��Y;��;��;��;��;��;��;��;��;��;��;��4�l84�^4�s�4���4g�L4�g64�{U4�nR4�4��4���7�u�7�t�7���7�5�7afv7�A�8 ^8�28��8�8��                                            CZ�CP�CuqC
KB��B��^B�.C pC�BCt�C9�?{u�?{u�?{u�?{u�?{u�?{u�?{u�?{u�?{u�?{u�?{u�{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��                                            C�/�C�/�C�/�C�/�C�/�C�/�C�/�C�/�C�/�C�/�C�/�C�aC�!|C�^�C��\C��C�_aC��3C��C���C��}C���C�ށC��!C��C�C�4�C�9�C�I�C�\�C�k�C�uFC��tC�m�C�*�C�a�C��BC���C���C��C�C�/C�!�C�.�C�Y9C�� C���C��&C��.C�:C�k!C���C��,C��'C��D>�@�>�]�>�t>��h>���>��D>�|D>��J>�=>�QK>��?8b�>�:�?y�>�;��hq)�����֣��L�JD��g)ۿ���E  2�      	b     �`@��     @��     03/28/21        23:15:22        B)�B#�B�vB��B��3BTBbB��A��rA�Z_A�L�A��A��A�xA��AxEA&��A'�A#5�A#��A'��A1��B��B�dvB���B��ZB�	WB�ΠB��B��hB�-�Bш�B׸fCڒ.C�fMC�7�C�?C��C���C���C�M
C��C�ZC�;IC�M0C�M0C�M0C�M0C�M0C�M0C�M0C�M0C�M0C�M0C�M0@3(�@p+@82@�}?��;@��@	�q@��?�H�?��?�y�C�"C��C�.C��NC�'C�Z�C�jtC���C�W�C���C���C��HC��HC��HC��HC��HC��HC��HC��HC��HC��HC��HC�RC~.Cb�C��B��hC�CqC �B��gC #3C��                                            A��fA���B��B��BA�B+��B3&�B7<'B;�]B9<AB0��>�+�>Ǥ�>�jM>�n>��'>�?'>�@,>���>�;�>�Q�>��j                                            {@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��?LOs?]?k�?t��?L��?��)?�\*?��?�6F?�Ŕ?�+�?��L?��?�g	?�$�?�o�@�@�z@:�@U�)@d@a�;�4
;��[;Ǣ�;�;�H;�f�;�~�;ǳ�;�,;�2;ʹ�;�i�;�i�;�i�;�i�;�i�;�i�;�i�;�i�;�i�;�i�;�i�47��4= �4B��4D��4!s4G,�4LWh4P��4T}�4VN�4Z�73C7P�=7��7�M(���+7��37���7���7��-7���7��                                            C�RC~.Cb�C��B��hC�CqC �B��gC #3C��?w�t?w�t?w�t?w�t?w�t?w�t?w�t?w�t?w�t?w�t?w�t{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��                                            C�O�C�O�C�O�C�O�C�O�C�O�C�O�C�O�C�O�C�O�C�O�C��tC�_C���C���C��0C��C���C��YC���C��XC��XC�,)C�@kC�F�C�RqC�[�C�nKC�z�C�~2C���C��
C��
C��bC�e[C���C�	lC��BC���C�8�C�5 C�@C�R�C�s�C��vC��C�)C�O�C�O�C��'C�̶C��C���C��sC��B>�+�>Ǥ�>�jM>�n>��'>�?'>�@,>���>�;�>�Q�>��j?{�>��>� �> `�[��"o��J���q�!<��;<뿖.�E 2�      	�     �0@��     @�     03/28/21        23:16:55        A��(A��Až�A��=Bfu�A���A���A��jA�4gA�k�A�1V@�+U@�x�@��C@�;@��s@���@���@��F@�F�@��@��YB�5B��|B���B��LB�,�B�]	B�0B��B��B�X�B�5�Cе�CҦHC�lCԖ|C��C�+C�<�Cح�C�8�CًC��TC�4�C�4�C�4�C�4�C�4�C�4�C�4�C�4�C�4�C�4�C�4�@�?��[?���?�g�?���?���?��?�%?��=?�ȕ?��C��rC���C��:C�;SC��C��qC��C~��C}��C~��C�C�C��C��C��C��C��C��C��C��C��C��C��C#TJC�C�[CO B�<sC��CQ�CIZCM�CwFC                                            A�I�A�эA��XB
-�BIB$�B+zB0�B4p�B2VB)�>Ȏ�>���>�3�>�>��!>�BP>���>���>��L>�?>��[                                            {@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��?�D?&#�?.x�?1�l?��?;�?P1�?r4?��?��?�,�?�d,?���?��6?�Ұ?y��?�#?��F?��!@@�@�&@'<;��l;�tg;��3;�D';�k;���;���;�l�;��y;��;���;�"W;�"W;�"W;�"W;�"W;�"W;�"W;�"W;�"W;�"W;�"W4�a74��4���4�^w4{<�4�+�4�L14��64��T4�QL4���6ݍj7��70z�7<蒶��x7;F7b��7s�7|��7���7�g                                            C#TJC�C�[CO B�<sC��CQ�CIZCM�CwFC?z �?z �?z �?z �?z �?z �?z �?z �?z �?z �?z �{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��                                            C���C���C���C���C���C���C���C���C���C���C���C��C��C��,C�Z|C��HC�gC�N*C�;�C�.�C�,�C�7�C�v�C��_C���C��MC��*C��/C�ɝC���C��#C��C��lC���C�IxC�~qC��C���C���C��6C��C��VC���C��iC�$�C�n}C��C��zC��@C�C�E�C�G�C�FC�OC�Jy>Ȏ�>���>�3�>�>��!>�BP>���>���>��L>�?>��[?�t=���>�^=�pe��h��z��	� �.�>7��F�6��q=E� 2I      	�     ��@�     @�>     03/28/21        23:18:31        A�HA��A��6A��PB:Q�A�pDA�K�Ay2|Ao��Ad�kA]��>-�Y���>F��<q�e�*򈿓��O9���4տ�WͿ�����1B�i�B�l�B�e�B��B���B�܀B���B��uB�MdB���B��CăQC�$CƂTC�f)Cɍ�C�`C�M�CʓC��AC�L�C�-�C���C���C���C���C���C���C���C���C���C���C���?�s�?��9?�[�?�_�?��Q?���?��$?�e ?v�6?e��?OΘCX�'CT��CS�CP��CQ^sCJ�"CICG��CF�CGiMCIA�Cma�Cma�Cma�Cma�Cma�Cma�Cma�Cma�Cma�Cma�Cma�B� B��B�vlB�g�B�^�B�7�B�d�B�U.B��eB�E�B�"|                                            A��~A�1�A�\�A�ϰA�B
>RB.�B@�B��B�B~�>��(>�E�>�� >���>��>�܏>��o>���>{�	>z�/>x�2                                            {@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��>� >��J?��?��>���?@�?#��?<�?Q�l?Y��?j�F?[�B?V�g?[�a?`"?O�N?�۽?�ʫ?�ް?���?�n,@W�;�=;�n�;��;���;���;���;���;�8.;�J�;�j;���;���;���;���;���;���;���;���;���;���;���;���4pB4x��4��Y4�+�4Rq�4��r4��G4��4���4��4�δ6��6��7��7m�q�7��7,Ӿ7;ml7C�s7H"p7GJC                                            B� B��B�vlB�g�B�^�B�7�B�d�B�U.B��eB�E�B�"|?}I?}I?}I?}I?}I?}I?}I?}I?}I?}I?}I{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��                                            C���C���C���C���C���C���C���C���C���C���C���C��hC�NtC�r�C���C�pC�@YC�u�C�[C�NWC�L!C�W�C�rdC��=C���C��C��rC��C��C���C��C��QC��(C��C�G
C�m{C���C�,bC�K�C���C�l5C�c�C�d-C�r�C��C�)C�?�C�d�C�r�C��C��C��C���C��wC���>��(>�E�>�� >���>��>�܏>��o>���>{�	>z�/>x�2? ܵ=�e�>f��=Q)Q���s�Y������<aY�G,)����E� 2�      	�     Ӡ@�>     @�|     03/28/21        23:19:48        A�9mA��cA�ҬA�YB �FA��BA��.A���A�qpA�{A��i�T�������X�S�t������������������s��h����(B�;B�%�B�ٷB�6B�y6B��B��)B�?�B���B�+@B���C���C�ؑC��C���C��{C�QXC��7C�_C���C��C���C��-C��-C��-C��-C��-C��-C��-C��-C��-C��-C��-@	�A?�?�/?�~�?��-?ŎP?�.5?��z?��G?`7�?, �C%C!�C ��C2tC�YC]C�C ?C�^C |C�C5�^C5�^C5�^C5�^C5�^C5�^C5�^C5�^C5�^C5�^C5�^B��B�\B�+Bwp�BM �BY�BU��BS��BQ��BUH�BYU�<��<5<�O<�#;�ϧ;�{<*�<n<^.<�z<ܚA�
�A�E@A��A��NA�8*A�	A���A�`�A��A�_A��>�+
>}V>vq�>g1�>M->Nҵ>Hby>F�>@[ >@��>@PH>fw=��B=�B�=�\�=�%�=��4=���=�0o=�y�=���=�Hs{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��?>�Q?>�?B��?F[�?-�v?[/�?m�g?s{T?}9k?tu?_�?��?��?��?��1?��?�/�?�G�@Wz@��@$_�@,�p;s��;uS;s��;u��;�5;w��;u��;ul�;v&�;u*;xQ�;cܮ;cܮ;cܮ;cܮ;cܮ;cܮ;cܮ;cܮ;cܮ;cܮ;cܮ5�@�5�n{5��g5���5b��5�v�5�Q15�Y�5�<5�g5�Ը6���6�bg6��6�G���>7��7�#7%�47-��713�70�6�9�6���6�46���6w�6�-6�n�6�z.6��6�
�6�]B��B�\B�+Bwp�BM �BY�BU��BS��BQ��BUH�BYU�?���?���?���?���?���?���?���?���?���?���?���{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��:���:�ǚ:��@:�G�:d�:�9:�E�:��(:��:���:�_�C���C���C���C���C���C���C���C���C���C���C���C�9�C���C���C��YC�u�C�>MC�^�C�O�C�L�C�P�C�_�C�5�C�F�C�GbC�U*C���C��KC��~C��SC��nC��C���C��5C��zC�:C�'CC�n�C��C��C��C���C���C���C�srC���C���C���C��C�	C�'�C�2�C�9�C�G�C�T>�+
>}V>vq�>g1�>M->Nҵ>Hby>F�>@[ >@��>@PH?��>~�>�>`P����R�t���S��?�J���]�����$E� 2      	�     �@@�|     @��     03/28/21        23:21:11        A���A�a�A��>A�[�B��A�o�A��A�۾A���A���A�IF��A����7�����_w��Y8�\`����%���y���t��gBCe]BF�xBF�|BG�1BasBN��BO��BOLBP�BR �BQ��C�ժC�<�C�:�C�b�C��-C�;�C�^�C�L�C��C��C��C�h�C�h�C�h�C�h�C�h�C�h�C�h�C�h�C�h�C�h�C�h�?��?�-?��?��I?��v?��?�o�?HO?��>��2>��B��B�lB���B���B���B��bB�Q'B�x�B��B�BCB�l�BڼmBڼmBڼmBڼmBڼmBڼmBڼmBڼmBڼmBڼmBڼmA�g�A�;�A�rA� �A��BA��A���AypBAyNmA��A}�@>4�>-I�>,�>%��=�`>�u>��>#�>\^>�w>#�AI�A��A�i�A���A�+A�|,AѭA��A��A��A�?�>zr�>aЋ>\��>OR�>7��>:�>3K�>,�>%��>%V�> �T@���@�C{@�eC@�0�@8�:@b}�@de@wN#@`�}@a4@p*�{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��?-]=?6cZ?>m�?A��?!:?I+�?O
h?5�k?&��?Բ>��?�?1?� \?���?�4?�ث?��-@N@ұ@{�@އ@�#;�� ;�;;�(;���;��;�L;��E;���;�6�;��f;�G+;�q;�q;�q;�q;�q;�q;�q;�q;�q;�q;�q6���6�y�6�@�6�*�6��w6��P6�V`6��T6��6���6�'H6܊�7I�7"}7$�S7q�t7I��7F�7`ak7^�7b[J7].E6^H�6�h6��6��]7�
6�-�6�T6奴6�)�6��Q6�ՕA�g�A�;�A�rA� �A��BA��A���AypBAyNmA��A}�@?���?���?���?���?���?���?���?���?���?���?���{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��=J=��=�~=	!�<֌<��><�c=(#=x.=3z=�C��C��C��C��C��C��C��C��C��C��C��C���C��,C��1C��C��C�%�C�*$C��C�#�C�)aC�1C�s
C�~�C��JC���C���C���C���C���C��C��aC���C��qC��kC��ZC��SC��C��C��vC��C��C�""C�C���C��uC���C���C���C��fC��C���C��C���C���>zr�>aЋ>\��>OR�>7��>:�>3K�>,�>%��>%V�> �T?[=��>��B>q<���q��W�����'�@�:F�t�E� 2>�      	�     �@��     @��     03/28/21        23:22:38        A�6�A�QFA���A��SA��sA�˶An�A\��AS� ARE�AWI��iJ�nj�.Q�3 �����g�������� ��4���B[N�BW�4BU��BRwiBgBL��BI�WBF-�BFNBE��BD�C�OKC���C��C�4aC���C�w�C� �C��-C��7C��(C�~C��tC��tC��tC��tC��tC��tC��tC��tC��tC��tC��t?h��?D7?;W�?(�]>��>��>�S�>l�>/1>��=� �B��B��B�<BB�7�B���Ba�Bx�BnBjMBk3�BkDB�keB�keB�keB�keB�keB�keB�keB�keB�keB�keB�ke@���@�\@G��@�WA�?�!?S)�>�d�?G�)?v��?F��>�}�>��>��W>�W�>�N>���>��\>�N>��C>���>ҝA2eAz�ZA���A���A��A��A�x�A��\B��B�B��>�9!>�=>x[�>`�F>BY>6�
>(�G>]�>�U>"�>MWAZ�rARh�AK]�AP��A s_AR��AUF�A\��Ab�*Ab�+Ajؽ{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��>�c�>�P�>��>��7>��>Ȇd>���>���>z&�>Y!�>G?n(�?y"�?��?���?W��?�\?��?��p?�42?�|U?�Z�;[��;[�;\!;\��;]�*;[]2;[�;Y�{;Y�;X��;Y�(;F;F;F;F;F;F;F;F;F;F;F6�7�6Ě�6�K�6�G�6���6��6���6�c�6�%�6�W<6���7C¬7s�F7�|�7��Z7�z"7��7��7�Bl7�o�7���7���8(�8M�8"�u8��8
k68��8�8	Z�8��8�v8Ij@���@�\@G��@�WA�?�!?S)�>�d�?G�)?v��?F��?��t?��t?��t?��t?��t?��t?��t?��t?��t?��t?��t{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��{@��=��>=��=���=�S>=g"f=�P�=���=���=��I=���=�B�C���C���C���C���C���C���C���C���C���C���C���C�SC�C�zC��gC��pC��
C���C�̵C�ՓC��*C��C�qhC�_�C�\kC�O�C�q�C�;xC�2�C�%�C�(C�&dC�%+C�WC��C��C��C��C��C�C��C�-bC�1�C�5�C�h�C�^�C�ZFC�^�C�~�C�d"C�b�C�VqC�`DC�`#C�j>>�9!>�=>x[�>`�F>BY>6�
>(�G>]�>�U>"�>MW>�C>a�>��}>���G��=���>-)>OK�=��=ڛ����