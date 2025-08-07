.PHONY: rosie
rosie:
	./tool/update_version.sh

to-branch:
	./tool/update_version.sh --to-branch