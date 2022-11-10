FROM nvidia/cuda:11.3.1-devel AS builder

WORKDIR /build

COPY . /build/

RUN make -f gpuburn.make

FROM 108202764860.dkr.ecr.us-east-1.amazonaws.com/robotics_ros_cuda11:release-1.0.0
RUN rm -rf /usr/lib/x86_64-linux-gnu/libnvidia-ml.so.1 /usr/lib/x86_64-linux-gnu/libcuda.so.1

COPY --from=builder /build/gpu_burn /app/
COPY --from=builder /build/compare.ptx /app/

WORKDIR /app

CMD ["./gpu_burn", "600"]
