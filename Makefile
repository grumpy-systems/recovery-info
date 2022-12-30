archive: pdf get-configs compress sync

get-configs:
	# Copy in backup configs to `/out/configs`

add-date:
	bash add-date.sh

compress:
	cd out && zip -r configs.zip .
	rm -r out/configs/

pdf: clean add-date
	docker run --rm \
	--volume "$(CURDIR):/data" \
	--user $(shell id -u):$(shell id -g) \
	pandoc/latex docs.md --top-level-division=chapter -o out/README.pdf

clean:
	rm -rf out
	rm -f *.zip
	mkdir -p out/configs

sync:
	rclone sync ./out dest:/data
	