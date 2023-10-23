
.PHONY: format analyze

format: ## Format code in current package
	dart format --line-length 80 --set-exit-if-changed lib test

analyze: ## Analyze code in current package
	flutter analyze lib test
