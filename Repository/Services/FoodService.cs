using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.Repositories;
using DataBaseAccess.Models;


namespace Repository.Services
{
    public class FoodService
    {
        private readonly IFoodRepository _foodRepo;

        public FoodService(IFoodRepository foodRepo)
        {
            _foodRepo = foodRepo;
        }

        public Task<List<Food>> GetMenu()
        {
            return _foodRepo.GetAll();
        }

        public async Task<Food> AddNewFood(int price, int cost, bool isAvailable, string name, int size, int points)
        {

            var newFood= new Food()
            {
                Price = price,
                Cost = cost,
                IsAvailable = isAvailable,
                Type = name,
                Size = size,
                Points = points
            };

            // Food creation 
            var entity = await this._foodRepo.Insert(newFood);
            //await this._AccountService.Save();
            return newFood;
        }

        public async void ChangeFoodAvailability(int id, bool availability)
        {
            var tmp = await _foodRepo.GetAll();
            var primaryKeys = new List<int>();

            foreach (var item in tmp)
                primaryKeys.Add(item.IdFood);

            if (primaryKeys.Contains(id))
            {
                await _foodRepo.UpdateFoodAvailability(id, availability);
                //await _foodRepo.Save();
            }
        }

        public async void UpdateFood(Food food)
        {
            var tmp = await _foodRepo.GetAll();
            var primaryKeys = new List<int>();

            foreach (var item in tmp)
                primaryKeys.Add(item.IdFood);

            if (primaryKeys.Contains(food.IdFood))
            {
                await _foodRepo.Update(food);
            }
        }

        public async void DeleteFood(int id)
        {
            var tmp = await _foodRepo.GetAll();
            var primaryKeys = new List<int>();

            foreach (var item in tmp)
                primaryKeys.Add(item.IdFood);

            if (primaryKeys.Contains(id))
            {
                await _foodRepo.Delete(id);
                //await _foodRepo.Save();
            }
        }

        public async Task<List<(Food, int)>> SelectItemsFromTheSummary(string summaryFromSessionStorage)
        {
            if (summaryFromSessionStorage != null)
            {
                // Format: *Id_Ammount**Id_Ammount*
                var afterSplit = summaryFromSessionStorage.Split('*', StringSplitOptions.RemoveEmptyEntries);
                List<(Food, int)> selectedDishes = new List<(Food, int)>();
                foreach (var item in afterSplit)
                {
                    // Format: Id_Ammount
                    var idAndAmmount = item.Split('_', StringSplitOptions.RemoveEmptyEntries);
                    selectedDishes.Add((await _foodRepo.GetById(Int32.Parse(idAndAmmount[0].ToString())), Int32.Parse(idAndAmmount[1].ToString())));
                }
                return selectedDishes;
            }
            else
                throw new Exception("Input string is null!");
        }

        public async Task<Food> GetFoodById(int id)
        {
            return await _foodRepo.GetById(id);
        }
    }
}
