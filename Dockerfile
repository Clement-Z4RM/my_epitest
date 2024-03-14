# syntax=docker/dockerfile:1

FROM epitechcontent/epitest-docker:latest

RUN dnf install fish zoxide fzf -y
