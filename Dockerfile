FROM nvidia/cuda:11.3.1-devel AS builder

WORKDIR /build

COPY . /build/

RUN make -f gpuburn.make

FROM boweryfarming/bowery-ros-cuda11:release-1.0.0

COPY --from=builder /build/gpu_burn /app/
COPY --from=builder /build/compare.ptx /app/

WORKDIR /app

CMD ["./gpu_burn", "600"]
