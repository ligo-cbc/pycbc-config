#!/bin/bash
/usr/bin/mpirun \
--verbose --verbose \
--np 41 \
--hostfile hosts \
\
--mca btl_tcp_if_include 10.0.0.0/8 \
\
-x X509_USER_PROXY \
-x PYTHONPATH \
-x PATH \
-x LD_LIBRARY_PATH \
-x LAL_DATA_PATH \
\
pycbc_live \
--bank-file o2bank_v1.hdf \
--sample-rate 2048 \
--enable-bank-start-frequency \
--low-frequency-cutoff 20 \
--approximant "SPAtmplt:mtotal<4" "SEOBNRv4_ROM:else" \
--chisq-bins "0.9 * get_freq('fSEOBNRv4Peak',params.mass1,params.mass2,params.spin1z,params.spin2z) ** (2.0 / 3.0)" \
--snr-abort-threshold 500 \
--sync \
--snr-threshold 5.5 \
--newsnr-threshold 5.0 \
--max-triggers-in-batch 25 \
--store-loudest-index 50 \
--analysis-chunk 8 \
--autogating-threshold 200 \
--highpass-frequency 13 \
--highpass-bandwidth 5 \
--highpass-reduction 200 \
--psd-samples 30 \
--max-psd-abort-distance 300 \
--min-psd-abort-distance 20 \
--psd-abort-difference .15 \
--psd-recalculate-difference .01 \
--psd-inverse-length 3.5 \
--psd-segment-length 4 \
--trim-padding .5 \
--store-psd \
--state-channel H1:GDS-CALIB_STATE_VECTOR L1:GDS-CALIB_STATE_VECTOR \
--channel-name H1:GDS-CALIB_STRAIN L1:GDS-CALIB_STRAIN \
--data-quality-channel H1:DMT-DQ_VECTOR L1:DMT-DQ_VECTOR \
--data-quality-flags OMC_DCPD_ADC_OVERFLOW ETMY_ESD_DAC_OVERFLOW \
--data-quality-padding 1.0 \
--increment-update-cache H1:/dev/shm/llhoft/H1/ L1:/dev/shm/llhoft/L1/ \
--frame-src H1:/dev/shm/llhoft/H1/* L1:/dev/shm/llhoft/L1/* \
--processing-scheme cpu:4 \
--fftw-input-float-wisdom-file float_02.wis \
--fftw-input-double-wisdom-file double_02.wis \
--fftw-measure-level 0 \
--increment 16 \
--enable-single-detector-background \
--single-newsnr-threshold 10 \
--single-duration-threshold 1.0 \
--single-fixed-ifar .06 \
--single-reduced-chisq-threshold 5.0 \
--analyze-flags SCIENCE_INTENT \
--verbose \
--max-batch-size 16777216 \
--frame-read-timeout 100 \
--output-path /atlas/user/pycbclive/pycbc.live/data \
--day-hour-output-prefix \
--background-statistic phasetd_newsnr \
--background-statistic-files /home/cbc/PyCBC_data/H1L1-PHASE_TIME_AMP_v1.hdf \
--enable-background-estimation \
--background-ifar-limit 100 \
--timeslide-interval 0.1 \
--ifar-upload-threshold .01 \
--enable-production-gracedb-upload \
--enable-gracedb-upload \
--enable-single-detector-upload \
--round-start-time 4