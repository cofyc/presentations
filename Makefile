PNGS += $(patsubst %.dot,%.png,$(wildcard *.dot))

all:
	go get -v golang.org/x/tools/cmd/present
	present

img: ${PNGS} ${SVGS}

${PNGS}: %.png: %.dot
	dot -T png $^ -o $@

