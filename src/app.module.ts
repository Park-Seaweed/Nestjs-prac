import { Module } from '@nestjs/common';
import { BoardsModule } from './boards/boards.module';
import { typeORMConfig } from './configs/typeorm.config';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [BoardsModule, TypeOrmModule.forRoot(typeORMConfig)],
})
export class AppModule {}
