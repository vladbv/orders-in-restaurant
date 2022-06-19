using DataBaseAccess.Models;
using Repository.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Xunit;
using FluentAssertions;
using Microsoft.EntityFrameworkCore;

namespace Tests.Repositories
{
    public class foodRepositoryShould
    {
        private readonly RestaurantDBContext _context;
        private IDbContextFactory<RestaurantDBContext> _factory;
        private DbContextOptions<RestaurantDBContext> _options;
        private string _dataBaseName = "In memory database - Food";

        public class Factory : IDbContextFactory<RestaurantDBContext>
        {
            public RestaurantDBContext _dbContext;
            private string _dataBaseName = "In memory database - Food";
            public Factory(RestaurantDBContext dBContext, string dataBaseName)
            {
                _dbContext = dBContext;
                _dataBaseName = dataBaseName;
            }
            public RestaurantDBContext CreateDbContext()
            {
                var _options = new DbContextOptionsBuilder<RestaurantDBContext>()
                                    .UseInMemoryDatabase(_dataBaseName)
                                    .Options;
                _dbContext = new RestaurantDBContext(_options);
                return _dbContext;
            }
        }

        public foodRepositoryShould()
        {
            _options = new DbContextOptionsBuilder<RestaurantDBContext>()
                .UseInMemoryDatabase(_dataBaseName)
                .Options;
            _context = new RestaurantDBContext(_options);
            _factory = new Factory(_context, _dataBaseName);
        }

        [Fact(DisplayName = "Manager is able to add new food to the database")]
        public async Task AddFood()
        {
            using (var context = _factory.CreateDbContext())
            {
                // Arrange
                var pr = new FoodRepository(_factory);
                var food = new Food()
                {
                    Type = "Margarita",
                    Size = 32,
                    Price = 17,
                    Cost = 7,
                    Points = 1,
                    IsAvailable = true
                };
                // Act
                var result = await pr.Insert(food);

                // Assert
                var menu = await context.Food.ToListAsync();
                Assert.Equal(menu.FirstOrDefault(p => p.Type == "Pepperoni")!.Type, result.Type);

                // Clean
                await pr.Delete(food.IdFood);
            }
        }

        [Fact(DisplayName = "Manager is able to delete food from the database")]
        public async Task DeleteFood()
        {
            using (var context = _factory.CreateDbContext())
            {
                // Arrange
                var pr = new FoodRepository(_factory);
                var food = new Food()
                {
                    Type = "Roma",
                    Size = 32,
                    Price = 15,
                    Cost = 6,
                    Points = 0,
                    IsAvailable = true
                };
                await pr.Insert(food);

                // Act
                var menuBeforeDelete = await context.Food.ToListAsync();
                await pr.Delete(food.IdFood);
                var menuAfterDelete = await context.Food.ToListAsync();

                // Assert
                Assert.NotEqual(menuBeforeDelete.Count, menuAfterDelete.Count);
            }
        }

        [Fact(DisplayName = "Manager is able to Update food in the database")]
        public async Task UpdateFood()
        {
            using (var context = _factory.CreateDbContext())
            {
                // Arrange
                var pr = new FoodRepository(_factory);
                var food = new Food()
                {
                    Type = "Funghi",
                    Size = 32,
                    Price = 14,
                    Cost = 5,
                    Points = 0,
                    IsAvailable = false
                };
                await pr.Insert(food);

                // Acting
                food.IsAvailable = true;
                var result = await pr.Update(food);
                var menu = await context.Food.ToListAsync();

                // Assert
                Assert.Equal(menu.FirstOrDefault(p => p.Type == "Funghi")!.IsAvailable, food.IsAvailable);

                // Clean
                await pr.Delete(food.IdFood);
            }
        }
    }
}
