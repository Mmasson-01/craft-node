FROM node:14.17-alpine as builder

# Timezone variable
ENV TIMEZONE=America/Montreal
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone

WORKDIR /install/node
COPY package*.json ./

RUN npm install

FROM builder as development

# Setup workdir
WORKDIR /app/storefront

# Copy all files
COPY . .

# Expose npm port
EXPOSE 3001

# Run app
ENTRYPOINT [ "/app/storefront/entrypoint.sh" ]
