using DataBaseAccess.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repositories
{
    public interface IFoodRepository : IRepository<Food>
    {
        Task<Food> UpdateFoodAvailability(int id, bool isAvailable);
    }

    public class FoodRepository : IFoodRepository
    {
        private readonly IDbContextFactory<RestaurantDBContext> _factory;
        public int lastId { get; set; }

        public FoodRepository(IDbContextFactory<RestaurantDBContext> factory)
        {
            this._factory = factory;
            using(var context = factory.CreateDbContext())
            {
                lastId = context.Food.ToList().Count + 1;
            }
        }

        public FoodRepository()
        {
        }

        public async Task Delete(int id)
        {
            using (var context = _factory.CreateDbContext())
            {
                var Food = await context.Food.FirstOrDefaultAsync(b => b.IdFood == id);
                if (Food != null)
                {
                    context.Remove(Food);
                    await context.SaveChangesAsync();
                }
            }
        }

        public async Task<Food> UpdateFoodAvailability(int id, bool isAvailable)
        {
            using (var context = _factory.CreateDbContext())
            {
                var entity = await context.Food.FirstOrDefaultAsync(b => b.IdFood == id);
                entity.IsAvailable = isAvailable;
                context.Food.Update(entity);
                await context.SaveChangesAsync();
                return entity;
            }
        }

        public async Task<List<Food>> GetAll()
        {
            using (var context = _factory.CreateDbContext())
            {
                return await context.Food.ToListAsync();
            }
        }

        public async Task<Food> GetById(int id)
        {
            using (var context = _factory.CreateDbContext())
            {
                return await context.Food.FindAsync(id);
            }
        }

        public async Task<Food> Insert(Food entity)
        {
            using (var context = _factory.CreateDbContext())
            {
                await context.Food.AddAsync(entity);
                await context.SaveChangesAsync();
                lastId++;
                return entity;
            }
        }
        public async Task<Food> Update(Food food)
        {
            using (var context = _factory.CreateDbContext())
            {
                context.Food.Update(food);
                await context.SaveChangesAsync();
                return food;
            }
        }
    }
}
