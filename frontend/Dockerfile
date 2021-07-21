FROM node:14.17-alpine

# Timezone variable
ENV TIMEZONE=America/Montreal
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone

# Setup workdir
WORKDIR /app/storefront

# Copy all files
COPY . .

# Install packages
RUN npm install --legacy-peer-deps

# Expose npm port
EXPOSE 3001

# Run app
CMD npm run dev
